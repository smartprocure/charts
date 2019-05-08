#!/bin/bash
docker build -t us.gcr.io/evident-plane-94217/mssql-linux:2017-CU13 .
docker push -- us.gcr.io/evident-plane-94217/mssql-linux:2017-CU13 
