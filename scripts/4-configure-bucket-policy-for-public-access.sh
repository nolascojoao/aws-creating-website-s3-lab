#!/bin/bash

# Bucket name
BUCKET_NAME="mybucket123456789-joao"

# Step 5: Configure bucket policy for public access
aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Public access block configuration updated for bucket '$BUCKET_NAME'."
else
    echo "Failed to update public access block configuration for bucket '$BUCKET_NAME'."
    exit 1
fi

# Set bucket policy to allow public access
aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'"$BUCKET_NAME"'/*"
        }
    ]
}'

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Bucket policy set to allow public access for bucket '$BUCKET_NAME'."
else
    echo "Failed to set bucket policy for bucket '$BUCKET_NAME'."
    exit 1
fi
