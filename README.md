# CoreDataEngineers ETL Project

This repo is for my Linux + Bash + SQL assignment.  
It shows how to do a simple ETL (Extract, Transform, Load) process and answer some questions with SQL.

## Folder setup
- Scripts/bash  (bash scripts like extract.sh, transform.sh, load.sh)
- Scripts/sql   (SQL query files: query1.sql, query2.sql, query3.sql, query4.sql)
- data/         (raw, transformed, and gold folders. I didn’t push the CSVs to GitHub)

## ETL steps
1. Extract: I download the CSV file from the URL (saved in raw folder). The URL is stored in an environment variable in my script.
2. Transform: I rename the column Variable_code to variable_code and only keep these columns: year, value, units, variable_code. The result is saved as 2023_year_finance.csv in the transformed folder.
3. Load: I move the transformed file into the gold folder.

Each script prints out messages so I know if the step worked or not.

## SQL questions
I wrote one .sql file for each question in Scripts/sql:
- query1.sql   Find order IDs where gloss_qty or poster_qty > 4000
- query2.sql   Find orders where standard_qty = 0 and gloss or poster > 1000
- query3.sql   Find company names starting with C or W, with 'ana' in the primary contact, but not 'eana'
- query4.sql   Join region, sales reps, and accounts, then sort accounts alphabetically


