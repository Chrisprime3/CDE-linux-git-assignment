SELECT name AS company_name,
       primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc ILIKE '%ana%')
  AND primary_poc NOT ILIKE '%eana%';
