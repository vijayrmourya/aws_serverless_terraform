import boto3


class clients:
    def __init__(self):
        pass

    def ec2_clients(self):
        self.ec2client = boto3.client('ec2')
        return self.ec2client

    def ec2_resources(self):
        self.ec2resource = boto3.resource('ec2')
        return self.ec2resource

class resources_class:
    def __init__(self, event, context):
        self.event = event
        self.context = context
        self.ec2resource = clients.ec2_resources

    def create_ec2(self):
        instance = self.ec2resource.create_instances(
            ImageId='ami-0f5ee92e2d63afc18',
            MinCount=1,
            MaxCount=1,
            InstanceType='t1.micro',
            Monitoring={
                'Enabled': True
            },
        )

    def describe_image(self):
        response = ec2client.describe_images(
            ImageIds=[
                'ami-0f5ee92e2d63afc18',
            ]
        )
        return response


def lambda_handler(event, context):
    ec2resource_object = resources_class(event, context)
    return ec2resource_object.describe_image()


print(lambda_handler('sedf', 'efa'))
