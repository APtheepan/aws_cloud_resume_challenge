import json
import boto3
from decimal import Decimal
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitorcount')

class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return json.JSONEncoder.default(self, obj)


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
        'body': json.dumps(count, default=lambda o: float(o) if isinstance(o, Decimal) else o)
    }