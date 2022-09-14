import boto3
import datetime

# Amazon Cognito User Pool Configs
LIMIT = 60
REGION = 'us-east-2'
USER_POOL_ID = 'us-east-2_j8lr68G53'

# Create boto3 CognitoIdentityProvider client
client = boto3.client('cognito-idp', REGION)
pagination_token = ""

# Degfine function that utilize ListUsers AWS API call
def get_list_cognito_users(cognito_idp_client, next_pagination_token ='', Limit = LIMIT):  

    return cognito_idp_client.list_users(
        UserPoolId = USER_POOL_ID,
        #AttributesToGet = ['name'],
        Limit = Limit,
        PaginationToken = next_pagination_token
    ) if next_pagination_token else cognito_idp_client.list_users(
        UserPoolId = USER_POOL_ID,
        #AttributesToGet = ['name'],
        Limit = Limit
    )
  
# Pull Batch of Amazon Cognito User Pool records  
user_records = get_list_cognito_users(
    cognito_idp_cliend = client,
    next_pagination_token = pagination_token,
    Limit = LIMIT
)

# Print out result
def datetimeconverter(o):
    if isinstance(o, datetime.datetime):
        return str(o)
  
json_formatted_str = json.dumps(user_records, indent=4, default=datetimeconverter)
print(json_formatted_str)  