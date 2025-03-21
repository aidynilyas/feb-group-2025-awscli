#!/bin/bash

vpcid=$(aws ec2 create-vpc --region us-east-2 --cidr-block 172.16.0.0/16 --query Vpc.VpcId --output text)
subnet=$(aws ec2 create-subnet --vpc-id $vpcid --cidr-block 172.16.1.0/24 --query Subnet.SubnetId --output text)
networkgateway=$(aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text)
aws ec2 attach-internet-gateway --vpc-id $vpcid --internet-gateway-id $networkgateway

echo "Done!"
