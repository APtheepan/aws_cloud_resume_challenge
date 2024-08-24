


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name        = "lambda_dynamodb_policy"
  description = "IAM policy for allowing Lambda to update DynamoDB table"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "dynamodb:UpdateItem",
        Resource = "arn:aws:dynamodb:us-east-1:637423423905:table/visitorcount"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "attach_lambda_dynamodb_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
}


/*
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

*/


/*
data "archive_file" "lambda" {
  type = "zip"
  source_file = "/home/theepan/aws_cloud_resume_challenge/backend/visitorcount.py"
  output_path = "/home/theepan/aws_cloud_resume_challenge/backend/visitorcount.zip"
  #source_file = "${path.module}/backend/visitorcount.py"
  #output_path = "${path.module}/backend/visitorcount.zip"
}
*/
resource "aws_lambda_function_url" "lambda_url" {
  function_name      = aws_lambda_function.visitorcount.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_function" "visitorcount" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  #filename         = "backend/visitorcount.zip"
  filename         = "https://github.com/APtheepan/aws_cloud_resume_challenge/blob/1675ee8d5efec1e9663b05877718a75f24af5f1c/backend/visitorcount.zip"
  function_name    = "visitorcount"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "visitorcount.lambda_handler"
  #source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.8"

}

