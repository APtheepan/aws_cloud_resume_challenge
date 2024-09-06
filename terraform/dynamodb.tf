

resource "aws_dynamodb_table" "visitorcount" {
  name         = "visitorcount"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
}


resource "aws_dynamodb_table_item" "views" {
  table_name = aws_dynamodb_table.visitorcount.name
  hash_key   = aws_dynamodb_table.visitorcount.hash_key
  item       = <<ITEM
{
  "id": {"S": "1"},
  "views": {"N": "1.0"}
}
ITEM
}