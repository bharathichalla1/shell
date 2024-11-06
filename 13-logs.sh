#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log" #$0 means script name 

echo "script starting executing at $TIMESTAMP" &>> $LOGFILE


VALIDATE(){
    if [ $1 -ne 0 ]
  then 
       echo -e "ERROR : $2..$R failed $N"
       exit 1
  else
       echo -e "$2..$G success $N"
    fi   
}

# here $1 is exit status, $2 is installing mysql

if [ $ID -ne 0 ]
then
  echo -e  "$R ERROR : please run the script with root user $N"
  exit 1 # it is EXIT STATUS to check the above command is success or not (to check you can enter echo $? if it is 0 means success, other than 0 means failure), you can give other than 0
else
  echo "you are root user"
fi   


yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"