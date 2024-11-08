#!/bin/bash

AMI=ami-0b4f379183e5706b9
SG_ID=sg-047ba035b5558d59f
INSTANCES=( "mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web" )

for i in "${INSTANCES[@]}"
do
    echo "instance is : $i"
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi    


    aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $INSTANCE_TYPE --security-group-ids sg-047ba035b5558d59f

done

