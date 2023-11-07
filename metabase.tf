module "terraform" {
  source = "./infra/"
  metabase_sql_password="abc123"
  cluster_name ="test"
  project_id ="data-eng-wagon"
}

