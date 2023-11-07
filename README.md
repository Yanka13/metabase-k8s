
```bash 
terraform init 
```

```bash 
terraform workspace new test 
terraform workspace select test 
```

replace metabase.tf with your metabase_sql_password, cluster_name and project_id : 

```tf
metabase_sql_password="abc123"
cluster_name ="test"
project_id ="data-eng-wagon"
```


```bash 
terraform apply 
```

update the dev/metabase.yaml file to replace with your project / cluster name / location 

```yaml
#[...]
- name: cloudsql-proxy
          image: gcr.io/cloud-sql-connectors/cloud-sql-proxy:2.1.0
          args:
            - "--port=5433"
            - "PROJECT_ID:LOCATION:metabase-data-TERRAFORMWORKSPACE"
          resources:

#[...]
---

apiVersion: v1
kind: ServiceAccount
metadata:
  name: metabase-cloudsql-proxy
  annotations:
    iam.gke.io/gcp-service-account: metabase-service-account-TERRAFORMWORKSPAC@PROJECT_ID.iam.gserviceaccount.com
```