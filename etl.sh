echo "Starting ETL process at $(date)"

# Step 1: Extract
bash extract.sh
if [ $? -ne 0 ]; then
  echo "Extract failed. Stopping ETL."
  exit 1
fi

# Step 2: Transform
bash transform.sh
if [ $? -ne 0 ]; then
  echo "Transform failed. Stopping ETL."
  exit 1
fi

# Step 3: Load
bash load.sh
if [ $? -ne 0 ]; then
  echo "Load failed."
  exit 1
fi

echo "ETL completed successfully at $(date)"
Sa
