
variable "access_key" {
  type = "string"
  description = "AWS access key"
}

variable "secret_key" {
  type = "string"
  description = "AWS secret access key"
}

variable "region" {
  type = "string"
  description = "AWS region"
}

variable "application_name" {
  type = "string"
  description = "Name of Elastic Beanstalk application"
}

variable "environment_name" {
  type = "string"
  description = "Name of Elastic Beanstalk environment"
}

variable "version_label" {
  type = "string"
  description = "Name of version of Elastic Beanstalk application"
}

variable "source_bucket" {
  type = "string"
  description = "Bucket that contain object with version of Elastic beanstalk application"
}

variable "source_key" {
  type = "string"
  description = "Object that contain version of Elastic beanstalk application"
}
