# transform Step


#  Setup file paths 
RAW_DIR="data/raw"
TRANSFORM_DIR="Transformed"
INPUT_FILE="$RAW_DIR/2023_year_finance.csv"
OUTPUT_FILE="$TRANSFORM_DIR/2023_year_finance.csv"

#  Making sure the Transformed folder exists 
mkdir -p "$TRANSFORM_DIR"

#  Check if raw file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo " ERROR: Raw file not found at $INPUT_FILE"
  exit 1
fi

echo " Raw file found. Starting transformation..."

# Do the transformation
#  - rename Variable_code → variable_code
#  - cut only the columns we need (Year, Value, Units, variable_code)
# 

#  get the header and modify it
header=$(head -n 1 "$INPUT_FILE" | sed 's/Variable_code/variable_code/')


# year=1, Value=9, Units=5, variable_code=6  (based on the header you shared earlier!)
awk -F, 'NR==1 {print "year,Value,Units,variable_code"} NR>1 {print $1","$9","$5","$6}' "$INPUT_FILE" > "$OUTPUT_FILE"

#  Confirm output 
if [ -f "$OUTPUT_FILE" ]; then
  echo " Transformation complete. File saved at $OUTPUT_FILE"
else
  echo " Transformation failed."
  exit 1
fi



