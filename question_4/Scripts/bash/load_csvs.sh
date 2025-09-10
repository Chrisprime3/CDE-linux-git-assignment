# Database connection details
DB_NAME="posey"
DB_USER="postgres"   # change if your username is different
CSVS_DIR="question_4/CSVs"

echo "Starting CSV import into database: $DB_NAME"

# Loop through all CSV files in the folder
for file in "$CSVS_DIR"/*.csv; do
    # Extract filename without extension (this will be the table name)
    filename=$(basename -- "$file")
    tablename="${filename%.*}"

    echo "Importing $filename into table $tablename ..."

    # Use psql to import the CSV
    # -d selects database
    # -U selects user
    # --csv tells Postgres it's a CSV
    # HEADER means it skips the first line (column names)
    psql -U "$DB_USER" -d "$DB_NAME" -c "\COPY $tablename FROM '$file' DELIMITER ',' CSV HEADER;"

    if [ $? -eq 0 ]; then
        echo "Successfully imported $filename into $tablename"
    else
        echo "Failed to import $filename"
    fi
done

echo "All files processed."
