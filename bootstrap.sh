# bootstrap.sh
#!/bin/bash

# Check if npm is installed
if ! command -v npm &> /dev/null
then
echo "npm could not be found. Please install npm to continue."
exit 1
fi

# Install JavaScript dependencies
npm install

echo "JavaScript dependencies installed successfully."
