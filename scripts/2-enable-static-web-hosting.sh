#!/bin/bash

# Bucket name
BUCKET_NAME="mybucket123456789-joao"

# Step 2: Enable static website hosting for the bucket
aws s3 website s3://"$BUCKET_NAME"/ --index-document index.html --error-document error.html

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Static website hosting enabled for bucket '$BUCKET_NAME'!"
else
    echo "Failed to enable static website hosting for bucket '$BUCKET_NAME'."
fi
