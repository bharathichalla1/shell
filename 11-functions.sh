#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
  then 
       echo "ERROR : installing mysql is failed"
       exit 1
  else
       echo "installing mysql is success"
    fi   
}

if [ $ID -ne 0 ]
then
  echo "ERROR : please run the script with root user"
  exit 1 # it is EXIT STATUS to check the above command is success or not (to check you can enter echo $? if it is 0 means success, other than 0 means failure), you can give other than 0
else
  echo "you are root user"
fi   


yum install mysql -y 

VALIDATE

yum install git -y

VALIDATE