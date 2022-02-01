import boto3
import os
region = 'us-east-1'
ec2 = boto3.resource('ec2', region_name=region)
instances_number = os.environ.get('instances_number', 1)
launch_template_name = os.environ.get('launch_template_name', 'crawler-app-renderer-dev')
launch_template = {
   'LaunchTemplateName': launch_template_name,
   'Version': '$Latest'
}
def lambda_handler(event, context):
    instances = ec2.create_instances(
        LaunchTemplate=launch_template,
        MinCount=int(instances_number),
        MaxCount=int(instances_number)
    )
