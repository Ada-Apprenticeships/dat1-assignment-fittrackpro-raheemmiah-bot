.open fittrackpro.db
.mode column
.headers ON

-- 4.1 
SELECT
    c.class_id,
    c.name AS class_name,
    s.first_name,
    s.last_name
FROM class_schedule AS cs
JOIN classes AS c
    ON cs.class_id = c.class_id
JOIN staff AS s
    ON cs.staff_id = s.staff_id
ORDER BY c.class_id;

-- 4.2 
SELECT
    c.class_id,
    c.name,
    cs.start_time,
    cs.end_time,
    c.capacity - COUNT(ca.class_attendance_id) AS available_spots
FROM class_schedule AS cs
JOIN classes AS c
    ON cs.class_id = c.class_id
LEFT JOIN class_attendance AS ca
    ON cs.schedule_id = ca.schedule_id
   AND ca.attendance_status = 'Registered'
WHERE date(cs.start_time) = '2025-02-01'
GROUP BY
    cs.schedule_id,
    c.class_id,
    c.name,
    cs.start_time,
    cs.end_time,
    c.capacity
ORDER BY cs.start_time;

-- 4.3 
INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
VALUES (
    (SELECT schedule_id
     FROM class_schedule
     WHERE class_id = 1
       AND date(start_time) = '2025-02-01'
     LIMIT 1),
    11,
    'Registered'
);

-- 4.4 
UPDATE class_attendance
SET attendance_status = 'Unattended'
WHERE member_id = 3
  AND schedule_id = 7;

-- 4.5 
SELECT
    c.class_id,
    c.name AS class_name,
    COUNT(ca.class_attendance_id) AS registration_count
FROM classes AS c
JOIN class_schedule AS cs
    ON c.class_id = cs.class_id
JOIN class_attendance AS ca
    ON cs.schedule_id = ca.schedule_id
WHERE ca.attendance_status = 'Registered'
GROUP BY
    c.class_id,
    c.name
ORDER BY registration_count DESC
LIMIT 1;

-- 4.6 
SELECT AVG(class_count) AS avg_classes_per_member
FROM (
    SELECT
        member_id,
        COUNT(*) AS class_count
    FROM class_attendance
    WHERE attendance_status IN ('Registered', 'Attended')
    GROUP BY member_id
);
