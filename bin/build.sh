
set -e
start=`date +%s`

aws_region=$1
access_key_id=$2
secret_key=$3

application_name=$4
environment_name=$5
version=$6

source_bucket=$7
source_key=$8

AWS_ACCESS_KEY_ID=$access_key_id AWS_SECRET_ACCESS_KEY=$secret_key aws elasticbeanstalk create-application-version --application-name $application_name --version-label $version --source-bundle S3Bucket=$source_bucket,S3Key=$source_key --region $aws_region
AWS_ACCESS_KEY_ID=$access_key_id AWS_SECRET_ACCESS_KEY=$secret_key aws elasticbeanstalk update-environment --environment-name $environment_name --version-label $version --region $aws_region

end=`date +%s`

echo Deploy version ended with success! Time elapsed: $((end-start)) seconds
