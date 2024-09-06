import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitorcount')


def lambda_handler(event, context):
    response = table.get_item(
        Key={
            'id': '1'
        }
    )
    item = response['Item']
    count = item['views']
    return {
        'statusCode': 200,
        'body': json.dumps(count)
    }