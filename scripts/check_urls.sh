#!/usr/bin/env bash

# Anti UTC
export TZ=Asia/Tokyo

# URL of your sitemap.xml
SITEMAP_URL="https://guaiguailei.net/sitemap.xml"

# Function to URL decode
urldecode() {
  # URL decode using Bash built-ins
  echo -e "$(sed 's/+/ /g; s/%\([0-9a-fA-F][0-9a-fA-F]\)/\\x\1/g')"
}

# Function to log messages with timestamp
log_message() {
  local message="$1"
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$timestamp $message" >&2
}

# Log start time
log_message "Execution started."

# Download sitemap.xml and decode URLs
curl -sL "$SITEMAP_URL" | grep -o "<loc>[^<]*" | sed 's/<loc>//' > decoded_sitemap.txt
urls=($(cat decoded_sitemap.txt))

# Iterate through URLs
for url in "${urls[@]}"; do
  decoded_url=$(urldecode <<< "$url")
  response=$(curl -Is "$decoded_url" | head -n 1)
  http_status=$(echo "$response" | cut -d' ' -f2)
  
  if [[ -z "$http_status" ]]; then
    http_status="N/A"
  fi
  
  echo "$decoded_url" # Save the URL for investigation
  
  if [[ "$http_status" != "200" ]]; then
    log_message "URL $decoded_url failed (HTTP $http_status)"
  fi
done

# Log end time
log_message "Execution completed."

# Clean up temporary files
rm -f decoded_sitemap.txt
