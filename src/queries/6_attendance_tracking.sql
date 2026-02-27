.open fittrackpro.db
.mode column
.headers ON

-- 6.1 
INSERT INTO attendance (member_id, location_id, check_in_time)
VALUES (7, 1, '2025-02-14 16:30:00');

-- 6.2 
SELECT
    date(check_in_time) AS visit_date,
    check_in_time,
    check_out_time
FROM attendance
WHERE member_id = 5
ORDER BY check_in_time;

-- 6.3 
SELECT
    strftime('%w', check_in_time) AS day_of_week,
    COUNT(*) AS visit_count
FROM attendance
GROUP BY strftime('%w', check_in_time)
ORDER BY visit_count DESC
LIMIT 1;

-- 6.4 
SELECT
    l.name AS location_name,
    ROUND(AVG(daily.daily_count), 2) AS avg_daily_attendance
FROM (
    SELECT
        location_id,
        date(check_in_time) AS visit_date,
        COUNT(*) AS daily_count
    FROM attendance
    GROUP BY location_id, date(check_in_time)
) daily
JOIN locations l
  ON l.location_id = daily.location_id
GROUP BY l.name
ORDER BY l.name;
