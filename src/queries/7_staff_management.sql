.open fittrackpro.db
.mode column
.headers ON

-- 7.1 
SELECT
    staff_id,
    first_name,
    last_name,
    position AS role
FROM staff
ORDER BY position, staff_id;

-- 7.2 
SELECT
    s.staff_id AS trainer_id,
    s.first_name,
    s.last_name,
    COUNT(pts.session_id) AS session_count
FROM personal_training_sessions AS pts
JOIN staff AS s
    ON pts.staff_id = s.staff_id
WHERE s.position = 'Trainer'
  AND pts.session_date >= '2025-01-20'
  AND pts.session_date <= date('2025-01-20', '+30 day')
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY session_count DESC;
