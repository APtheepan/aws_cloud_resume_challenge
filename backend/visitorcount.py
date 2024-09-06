import json
import boto3
# import request

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitorcount')

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

    get_response = table.get_item(
        Key={
            'id': '1'
        }
    )
    item = get_response['Item']
    count = item['views']
    print(count)



   
