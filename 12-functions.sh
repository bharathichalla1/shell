#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
  then 
       echo "ERROR : $2..failed"
       exit 1
  else
       echo "$2..success"
}

# here $1 is exit status, $2 is installing mysql

if [ $ID -ne 0 ]
then
  echo "ERROR : please run the script with root user"
  exit 1 # it is EXIT STATUS to check the above command is success or not (to check you can enter echo $? if it is 0 means success, other than 0 means failure), you can give other than 0
else
  echo "you are root user"
fi   


yum install mysql -y 

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "installing git"