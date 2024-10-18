#!/bin/bash

# Bucket name
BUCKET_NAME="mybucket123456789-joao"

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region us-east-1

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' created successfully!"
else
    echo "Failed to create bucket '$BUCKET_NAME'."
fi
