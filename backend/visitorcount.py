import json
import boto3
from decimal import Decimal
# import request

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitorcount')


class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return json.JSONEncoder.default(self, obj)


def lambda_handler(event, context):

    response = table.update_item(
    Key={
        'id': '1'
    },
    UpdateExpression='SET #s = #s + :val',
    ExpressionAttributeNames={
        "#s": "views"
    },
    ExpressionAttributeValues={
        ':val': 1
    },
    ReturnValues="UPDATED_NEW"
    )
    
    updated_count = response['Attributes']['views']
    
    return {
        'views': json.dumps(updated_count,cls=DecimalEncoder)
    }


