# terraform-eb-deploy-version

Terraform module for deploy new version of Elastic Beanstalk.

## Motivation

Terraform resource cannot make history of EB versions. This
module use bash for do that.

## Usage

```hcl

resource "aws_s3_bucket" "beanstalk_application_versions" {
  bucket = "beanstalk_application_versions"

  # ...other options
}

resource "aws_s3_bucket_object" "beanstalk_application_version" {
  bucket = "${aws_s3_bucket.beanstalk_application_versions.name}"
  key    = "version_file.zip"

  # ...other options
}

resource "aws_elastic_beanstalk_application" "example_application" {
  name        = "example_name"

  # ... next options
}

resource "aws_elastic_beanstalk_environment" "example_environment" {
  name        = "example_name"

  # ... next options
}

module "eb_version_deploy" {
  source = "github.com/Rastopyr/terraform-eb-deploy-version"

  access_key = "<aws_access_key_id>"
  secret_key = "<aws_secret_key_id>"
  region = "<aws_region>"

  application_name = "${aws_elastic_beanstalk_application.example_application.name}"
  environment_name = "${aws_elastic_beanstalk_environment.example_environment.name}"

  version_label = "<version_name>"

  source_bucket = "${aws_s3_bucket.beanstalk_application_versions.name}"
  source_key = "${aws_s3_bucket_object.beanstalk_application_version.name}"
}

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
