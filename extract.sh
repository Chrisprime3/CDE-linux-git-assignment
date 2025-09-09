

# Extract Step

# --------------------------
# Making sure the environment variable is set
# --------------------------
if [ -z "$DATA_URL" ]; then
  echo "[Extract] ERROR: DATA_URL is not set. Please export it before running."
  echo "Example: export DATA_URL='https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv'"
  exit 1
fi


#folder and file name

RAW_DIR="data/raw"
RAW_FILE="$RAW_DIR/2023_year_finance.csv"

# Create raw folder
mkdir -p "$RAW_DIR"

echo "[Extract] Downloading CSV from: $DATA_URL"


# Download using cur

curl -o "$RAW_FILE" "$DATA_URL"


# Confirming the file exists

if [ -f "$RAW_FILE" ]; then
  echo "[Extract] File successfully downloaded to $RAW_FILE"
  ls -lh "$RAW_FILE"  # Show file details (size, location)
else
  echo "[Extract] Download failed!"
  exit 1
fi

