#!/bin/bash

# Bucket name
BUCKET_NAME="mybucket123456789-joao"

# Step 7: Clean Up Resources

# Remove S3 Bucket Policy
aws s3api delete-bucket-policy --bucket "$BUCKET_NAME"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Bucket policy deleted for bucket '$BUCKET_NAME'."
else
    echo "Failed to delete bucket policy for bucket '$BUCKET_NAME'."
fi

# Delete All Objects from S3 Bucket
aws s3 rm s3://"$BUCKET_NAME" --recursive

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "All objects deleted from bucket '$BUCKET_NAME'."
else
    echo "Failed to delete objects from bucket '$BUCKET_NAME'."
fi

# Delete S3 Bucket
aws s3api delete-bucket --bucket "$BUCKET_NAME"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' deleted successfully."
else
    echo "Failed to delete bucket '$BUCKET_NAME'."
fi
