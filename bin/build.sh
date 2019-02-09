
set -e
start=`date +%s`

application_name=$1
environment_name=$2
version=$3

source_bucket=$4
source_key=$5

file_path=$6

aws_region=$7

aws s3api put-object --bucket $source_bucket --key $source_key --region $aws_region --body $file_path

aws elasticbeanstalk create-application-version --application-name $application_name --version-label $version --source-bundle S3Bucket=$source_bucket,S3Key=$source_key --region $aws_region
aws elasticbeanstalk update-environment --environment-name $environment_name --version-label $version --region $aws_region

sleep 50

end=`date +%s`

echo "Deploy version ended with success! Time elapsed: $((end-start)) seconds"
