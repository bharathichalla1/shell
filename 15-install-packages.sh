#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script starting executing at $TIMESTAMP" &>> $LOGFILE


VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo -e "$2 ...$R FAILED $N"
    else
         echo -e "$2 ...$G SUCCESS $N"
    fi     
}

if [ $ID -ne 0 ]
then
  echo -e  "$R ERROR : please run the script with root user $N"
  exit 1 # it is EXIT STATUS to check the above command is success or not (to check you can enter echo $? if it is 0 means success, other than 0 means failure), you can give other than 0
else
  echo "you are root user"
fi   

#echo "all arguments passws : $@"
#git mysql postfix

for package in $@
do
    yum list linstalled $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
       yum install $package -y &>> $LOGFILE # install the package
       VALIDATE $? "installation of $package" #validate
    else
        echo -e "$package is already installed...$Y SKIPPING $N"
    fi     
done 