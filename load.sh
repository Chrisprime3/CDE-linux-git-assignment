# Setup folders and file paths 
TRANSFORM_DIR="data/Transformed"
GOLD_DIR="data/Gold"
INPUT_FILE="$TRANSFORM_DIR/2023_year_finance.csv"
OUTPUT_FILE="$GOLD_DIR/2023_year_finance.csv"

#  Make sure the Gold folder exists 
mkdir -p "$GOLD_DIR"

#  Check if transformed file exists 
if [ ! -f "$INPUT_FILE" ]; then
  echo "ERROR: Transformed file not found at $INPUT_FILE"
  exit 1
fi

echo "Transformed file found. Starting load process..."

# Copy file into Gold 
cp "$INPUT_FILE" "$OUTPUT_FILE"

#  Confirm it worked 
if [ -f "$OUTPUT_FILE" ]; then
  echo "Load complete. File saved at $OUTPUT_FILE"
else
  echo "ERROR: Load failed."
  exit 1
fi
