#!/bin/bash

oc new-project dev
oc new-project stage

oc new-project cicd

oc policy add-role-to-group edit system:serviceaccounts:cicd -n dev
oc policy add-role-to-group edit system:serviceaccounts:cicd -n stage

oc new-app --template=jenkins-persistent

echo "************************** going to sleep ********************************"
sleep 120
echo "************************** wakingup from sleep ********************************"

oc new-app -n cicd -f /home/student/openshift-cd-demo/cicd-template.yaml --param ENABLE_QUAY=true --param QUAY_USERNAME=hsaid4327 --param QUAY_PASSWORD=NabIla4327



