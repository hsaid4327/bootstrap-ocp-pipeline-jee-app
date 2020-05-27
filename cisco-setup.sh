#!/bin/bash

oc new-project cisco-dev
oc new-project cisco-stage

oc new-project cisco-cicd

oc policy add-role-to-group edit system:serviceaccounts:cisco-cicd -n cisco-dev
oc policy add-role-to-group edit system:serviceaccounts:cisco-cicd -n cisco-stage

oc new-app --template=jenkins-persistent

echo "************************** going to sleep ********************************"
sleep 120
echo "************************** wakingup from sleep ********************************"

oc new-app -n cisco-cicd -f cisco-cicd-template.yaml --param ENABLE_QUAY=true --param QUAY_USERNAME=hsaid4327 --param QUAY_PASSWORD=NabIla4327



