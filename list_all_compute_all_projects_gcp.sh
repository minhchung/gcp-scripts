#!/bin/bash

for PROJECT in $(\
  gcloud projects list \
  --format="value(projectId)")
do
  printf "%s:\n" ${PROJECT}
  gcloud compute instances list \
          --format="value(name,networkInterfaces.networkIP)" \
          --project ${PROJECT}
  printf "\n"
done
