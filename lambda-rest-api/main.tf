module "rest-api-resource" {
  source = "../../terraform-modules/api-gateway/REST-APIs"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  http-api-name = var.rest-api-name
}

module "lambda" {
  source = "../../terraform-modules/aws-lambda"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  ArchiveFolderName = "CheckLeapYear"
  lambda_function_name = var.functionName
}

module "lambda_integration" {
  source = "../../terraform-modules/api-integrations/HTTP-Lambda-integration"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  api-gateway-id = module.rest-api-resource
  lambda-func-invoke-arn = module.lambda.lambda-invoke-arn
}