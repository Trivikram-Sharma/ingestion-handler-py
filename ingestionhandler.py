import boto3
import json
import pprint
import base64


def lambda_handler(event, context):
    lambda_client = boto3.client('lambda')
    global lambda_payload
    for record in event['Records']:
        data_point = base64.b64decode(record['kinesis']['data'])
        data_point = str(data_point, 'utf-8')
        pprint(data_point, sort_dicts=False)
        data_point = json.loads(data_point)
        if(data_point['locationof']=="Taxi"):
            lambda_payload = {
                    'requestType' : "taxi-location-write",
                    'payloadData': {
                        'name' : data_point["name"],
                        'number' : data_point["number"],
                        'type' : data_point["type"],
                        'location_x' : data_point["location_x"],
                        'location_y' : data_point["location_y"],
                        'locationof' : data_point["locationof"],
                        'timestamp' : data_point["timestamp"]
                    }
            }
            lambda_payload = json.loads(json.dumps(lambda_payload))
            lambda_client.invoke(FunctionName='databasehandler',
                                 InvocationType='RequestResponse',
                                 Payload = lambda_payload)
            #pass
        if(data_point['location']=="user"):
            lambda_payload = {
                'requestType': "user-location-write",
                'payloadData': {
                    'name': data_point["name"],
                    'email': data_point["email"],
                    'location_x': data_point["location_x"],
                    'location_y': data_point["location_y"],
                    'locationof': data_point["locationof"],
                    'timestamp': data_point["timestamp"]
                }
            }
            lambda_payload = json.loads(json.dumps(lambda_payload))
            lambda_client.invoke(FunctionName='databasehandler',
                                 InvocationType='RequestResponse',
                                 Payload=lambda_payload)
            #pass

    return 1
