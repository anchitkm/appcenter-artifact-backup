#!/bin/bash

# Configuration
ORG_NAME="YOUR_ORG_NAME"
APP_NAME="YOUR_APP_NAME"
API_TOKEN="API_TOKEN"
BASE_URL="https://api.appcenter.ms/v0.1/apps/$ORG_NAME/$APP_NAME/releases"
OUTPUT_DIR="./$APP_NAME"

mkdir -p "$OUTPUT_DIR"

echo "Fetching releases from App Center..."
RELEASES=$(curl -s -H "X-API-Token: $API_TOKEN" "$BASE_URL")

# Extract release IDs and versions manually 
echo "$RELEASES" | grep -oE '"id":[0-9]+' | awk -F: '{print $2}' | while read -r ID; do
    VERSION=$(echo "$RELEASES" | grep -oE "\"id\":$ID,.?\"short_version\":\"[^\"]+\"" | sed -E 's/."short_version":"([^"]+)".*/\1/')

    # Fetch release details to get download URL
    RELEASE_DETAILS=$(curl -s -H "X-API-Token: $API_TOKEN" "https://api.appcenter.ms/v0.1/apps/$ORG_NAME/$APP_NAME/releases/$ID")
    DOWNLOAD_URL=$(echo "$RELEASE_DETAILS" | grep -oE '"download_url":"[^"]+"' | sed -E 's/."download_url":"([^"]+)"./\1/')
    
echo "Download URL is $DOWNLOAD_URL "
echo "RELEASE_DETAILS is $RELEASE_DETAILS "

    # Skip if no download URL found
    if [ -z "$DOWNLOAD_URL" ]; then
        echo "No direct download URL for release $ID ($VERSION)"
        continue
    fi

    # Create directory and download binary
    BUILD_DIR="$OUTPUT_DIR/build_$VERSION"
    mkdir -p "$BUILD_DIR"
    echo "Downloading build $VERSION from $DOWNLOAD_URL..."
    curl -L -H "X-API-Token: $API_TOKEN" "$DOWNLOAD_URL" --output "$BUILD_DIR/$VERSION.apk"
done

echo "Backup complete!"