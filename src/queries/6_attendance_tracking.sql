.open fittrackpro.db
.mode column
.headers ON

-- 6.1 
INSERT INTO attendance (member_id, location_id, check_in_time)
VALUES (7, 1, '2025-02-14 16:30:00');
-- Records a gym visit by inserting a new attendance record with member ID, location ID and check in time

-- 6.2 
SELECT
    date(check_in_time) AS visit_date,
    check_in_time,
    check_out_time
FROM attendance
WHERE member_id = 5
ORDER BY check_in_time;
-- Retrieves attendance history for a member by filtering attendance records and displaying visit date and times

-- 6.3 
SELECT
    strftime('%w', check_in_time) AS day_of_week,
    COUNT(*) AS visit_count
FROM attendance
GROUP BY strftime('%w', check_in_time)
ORDER BY visit_count DESC
LIMIT 1;
-- Finds the busiest weekday by counting attendance records grouped by day of the week and returning the highest total

-- 6.4 
SELECT
    l.name AS location_name,
    AVG(daily_count) AS avg_daily_attendance
FROM (
    SELECT
        location_id,
        date(check_in_time) AS visit_date,
        COUNT(*) AS daily_count
    FROM attendance
    GROUP BY location_id, date(check_in_time)
) AS daily
JOIN locations AS l
    ON daily.location_id = l.location_id
GROUP BY l.name
ORDER BY l.name;
-- Calculates average daily attendance by counting visits per day per location and averaging those totals
