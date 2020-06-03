module "audit" {
  source                                  = "./environments/audit"
}

module "dev" {
  source                                  = "./environments/dev"
}

module "prod" {
  source                                  = "./environments/prod"
}

module "shared-services" {
  source                                  = "./environments/shared-services"
}