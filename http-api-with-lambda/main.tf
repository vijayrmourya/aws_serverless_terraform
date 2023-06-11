module "http-api-for-lambda" {
  source = "../../terraform_modules/api-gateway/HTTP-APIs"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  http-api-name = var.api-name
}

module "another-http-api-module-demo" {
  source = "../../terraform-modules/api-gateway/HTTP-APIs"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  http-api-name = var.api-name-dummy
  api_stages = {
    dev = {
      name        = "dev"
      auto_deploy = true
    }
  }
}

module "lambda" {
  source = "../../terraform_modules/aws-lambda"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  ArchiveFolderName = "CheckLeapYear"
  lambda_function_name = var.functionName
}

module "lambda_integration" {
  source = "../../terraform-modules/api-integrations/HTTP-Lambda-integration"
  #  refer: https://github.com/vijayrmourya/terraform-modules

  api-gateway-id = module.http-api-for-lambda.api-id
  lambda-func-invoke-arn = module.lambda.lambda-invoke-arn
}