.open fittrackpro.db
.mode column
.headers ON

-- 1.1
SELECT member_id, first_name, last_name, email, join_date
FROM members;
--Retrieves all members by selecting key identifying and contact information for every member stored in the members table.

-- 1.2
UPDATE members
SET phone_number = '07000 100005',
    email = 'emily.jones.updated@email.com'
WHERE member_id = 5;
-- Updates the member's contact information (the phone number and email address) primary key value 5.The WHERE clause makes sure that only one row is affected.

-- 1.3
SELECT
    COUNT(*)
AS total_members
FROM members;
-- COUNT(*) counts the total number of rows in the members table, which represents the total number of members

-- 1.4
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(*) AS registration_count
FROM members AS m
JOIN class_attendance AS ca
ON ca.member_id = m.member_id
WHERE ca.attendance_status = 'Registered'
GROUP BY
    m.member_id,
    m.first_name,
    m.last_name
ORDER BY registration_count DESC
LIMIT 1;
-- Finds the member with the most class registrations by counting how many times each member appears in the class_attendance table with a status of 'Registered'

-- 1.5
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(ca.class_attendance_id) AS registration_count
FROM members AS m
LEFT JOIN class_attendance AS ca
    ON ca.member_id = m.member_id
   AND ca.attendance_status = 'Registered'
GROUP BY
    m.member_id,
    m.first_name,
    m.last_name
ORDER BY
    registration_count ASC,
    m.member_id ASC
LIMIT 1;
-- Finds the member with the least class registrations by including members with zero registrations using LEFT JOIN

-- 1.6
SELECT COUNT(*) AS members_attended_at_least_two
FROM (
    SELECT member_id
    FROM class_attendance
    WHERE attendance_status = 'Attended'
    GROUP BY member_id
    HAVING COUNT(*) >= 2
);
-- Counts the total number of members who have attended at least two classes by grouping attended records per member and filtering with HAVING COUNT(*) >= 2