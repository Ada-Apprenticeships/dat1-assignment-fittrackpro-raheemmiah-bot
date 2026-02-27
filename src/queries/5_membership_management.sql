.open fittrackpro.db
.mode column
.headers ON

-- 5.1 
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    ms.type AS membership_type,
    m.join_date
FROM memberships AS ms
JOIN members AS m
    ON ms.member_id = m.member_id
WHERE ms.status = 'Active'
ORDER BY m.member_id;

-- 5.2 
SELECT
    ms.type AS membership_type,
    AVG((julianday(a.check_out_time) - julianday(a.check_in_time)) * 1440)
        AS avg_visit_duration_minutes
FROM attendance AS a
JOIN memberships AS ms
    ON a.member_id = ms.member_id
GROUP BY ms.type
ORDER BY membership_type;

-- 5.3 
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    ms.end_date
FROM memberships AS ms
JOIN members AS m
    ON ms.member_id = m.member_id
WHERE ms.end_date >= '2025-01-01'
  AND ms.end_date <= '2025-12-31'
ORDER BY ms.end_date;
