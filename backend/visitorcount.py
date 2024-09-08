import json
import boto3
# import requests

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
    #updated_views = response['Attributes']['views']
    #return updated_views