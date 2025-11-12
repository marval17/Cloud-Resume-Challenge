import json
import boto3
from decimal import Decimal

def lambda_handler(event, context):
    table_name = "visitor_count"
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table(table_name)

    # Get current visitor count
    response = table.get_item(Key={"id": "visitors"})
    current_count = int(response["Item"]["count"]) if "Item" in response else 0

    path = event.get("rawPath", "/")

    if path == "/count":
        # Increment visitor count
        new_count = current_count + 1
        table.put_item(Item={"id": "visitors", "count": Decimal(new_count)})
    else:
        # Just return current count (no increment)
        new_count = current_count

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({"count": int(new_count)})
    }
