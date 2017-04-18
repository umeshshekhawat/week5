#!/bin/bash

date= TZ=GMT+12 date +%Y-%m-%d" "%H:%M:%S


information=$( aws ec2 describe-instances --query 'Reservations[*].Instances[?LaunchTime>=date].[InstanceId]' --output text | sort -n)
 
printf "%s" "${information[@]}" > data.txt

for id in $(cat data.txt)

do

aws ec2 terminate-instances --instance-ids $id   

done
