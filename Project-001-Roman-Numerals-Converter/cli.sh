1- 
sudo hostnamectl set-hostname aws-cli

2-
bash

3-
aws --version

4-
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
/usr/local/bin/aws --version

5-
aws configure

Access key ID: XXXXXXXXXXXXXXXXXXX
Secret access key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Default region name [None]: us-east-1
Default output format [None]: json

6-
aws sts get-caller-identity --query Account --output text

7-
aws ec2 create-security-group \
    --group-name roman_numbers_sec_grp \  # Sec. gruba isim verdiğimiz yer.
    --description "This Sec Group is to allow ssh and http from anywhere"

8-
aws ec2 describe-security-groups --group-names roman_numbers_sec_grp

9-
curl https://checkip.amazonaws.com  # public dns numaraasını kontrol ediyor.

10-
aws ec2 authorize-security-group-ingress \
    --group-name roman_numbers_sec_grp \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

11-
aws ec2 authorize-security-group-ingress \
    --group-name roman_numbers_sec_grp \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0


12-
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region us-east-1

13-
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text

14-
LATEST_AMI=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text)

15-
echo $LATEST_AMI

16-
sudo vi userdata.sh

17-
aws ec2 run-instances \
    --image-id $LATEST_AMI \
    --count 1 \   
    --instance-type t2.micro \
    --key-name firstkey \     
    --security-groups roman_numbers_sec_grp \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=roman_numbers}]' \
    --user-data file:///home/ec2-user/userdata.sh

18-
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers"

19-
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers" --query 'Reservations[].Instances[].PublicIpAddress[]'

20-
aws ec2 describe-instances --filters "Name=tag:Name,Values=roman_numbers" --query 'Reservations[].Instances[].InstanceId[]'

21-
aws ec2 terminate-instances --instance-ids xxxxxxxxxxxx

22-
aws ec2 delete-security-group --group-name roman_numbers_sec_grp


