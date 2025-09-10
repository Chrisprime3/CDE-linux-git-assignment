

 #source folder
SOURCE_DIR="New_folder"

#destination folder
DEST_DIR="coredataengineers-etl/json_and_CSV"

#Checking if destination folder exists
if [ ! -d "$DEST_DIR" ]; then
  echo "Creating destination folder: $DEST_DIR"
  mkdir -p "$DEST_DIR"
fi

# Checking if source folder exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "ERROR: Source folder $SOURCE_DIR does not exist!"
  exit 1
fi

# Move CSV files
echo "Moving CSV files..."
mv "$SOURCE_DIR"/*.csv "$DEST_DIR" 2>/dev/null

# Move JSON files
echo "Moving JSON files..."
mv "$SOURCE_DIR"/*.json "$DEST_DIR" 2>/dev/null

# Confirm the result
echo "All CSV and JSON files have been moved to: $DEST_DIR"
