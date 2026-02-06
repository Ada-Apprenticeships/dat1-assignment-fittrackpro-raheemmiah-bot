.open fittrackpro.db
.mode column

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
-- Lists classes with their instructors by joining class_schedule with classes and staff using matching IDs

-- 4.2 


-- 4.3 


-- 4.4 


-- 4.5 


-- 4.6 

