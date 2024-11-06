#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
  echo "ERROR : please run the script with root user"
  exit 1 # you can give other than 0
else
  echo "you are root user"
fi    


yum install mysql -y