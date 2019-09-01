#!/bin/bash

aws s3api list-objects --bucket todo-api-diz-storage --query "[sum(Contents[].Size), length(Contents[])]"
