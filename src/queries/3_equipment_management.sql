.open fittrackpro.db
.mode column
.headers ON

-- 3.1 
SELECT
    equipment_id,
    name,
    next_maintenance_date
FROM equipment
WHERE next_maintenance_date >= '2025-01-01'
  AND next_maintenance_date <= date('2025-01-01', '+30 day')
ORDER BY next_maintenance_date;
-- Retrieves equipment scheduled for maintenance within 30 days from 1 January 2025 by filtering dates in the specified range

-- 3.2 
SELECT
    type AS equipment_type,
    COUNT(*) AS count
FROM equipment
GROUP BY type
ORDER BY equipment_type;
-- Counts how many pieces of equipment exist per type by grouping equipment records and counting rows in each group

-- 3.3 
SELECT
    type AS equipment_type,
    ROUND(AVG(julianday('now') - julianday(purchase_date))) AS avg_age_days
FROM equipment
GROUP BY type
ORDER BY equipment_type;
-- Calculates the average age of equipment in days by converting dates to numeric day values, subtracting purchase dates from current date and averaging per equipment type
