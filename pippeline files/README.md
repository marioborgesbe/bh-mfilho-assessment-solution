#Pipepline files.

The pipeline files were built in Jenkins

#bh_app_pipeline
    - Pull the code from source, build and test
    - Build a Docker image and push it to a Docker Dev Server
    - Pipeline is able to deploy across different environments, but here only DEV is demonstrated.

#bh_infra_pipeline
    - Assumes there is a server alredy built to be able to run the pipeline to deploy or destroy infra assets