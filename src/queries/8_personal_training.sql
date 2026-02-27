.open fittrackpro.db
.mode column
.headers ON

-- 8.1 
SELECT
    pts.session_id,
    m.first_name,
    m.last_name,
    pts.session_date,
    pts.start_time,
    pts.end_time
FROM personal_training_sessions AS pts
JOIN members AS m
    ON pts.member_id = m.member_id
JOIN staff AS s
    ON pts.staff_id = s.staff_id
WHERE s.first_name = 'Ivy'
  AND s.last_name = 'Irwin'
ORDER BY pts.session_date, pts.start_time;
