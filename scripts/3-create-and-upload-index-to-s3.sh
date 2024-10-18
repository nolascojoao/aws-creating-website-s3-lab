#!/bin/bash

# Bucket name
BUCKET_NAME="mybucket123456789-joao"

# Step 3: Create a simple index.html file
cat <<EOL > index.html
<!DOCTYPE html>
<html>
<head>
    <title>My S3 Static Website</title>
</head>
<body>
    <h1>Welcome to My Static Website hosted on S3!</h1>
</body>
</html>
EOL

# Inform that the index.html file was created
echo "Created index.html file."

# Upload the index.html file to the S3 bucket
aws s3 cp index.html s3://"$BUCKET_NAME"/

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "index.html uploaded to bucket '$BUCKET_NAME'."
else
    echo "Failed to upload index.html to bucket '$BUCKET_NAME'."
fi
