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


-- 1.5


-- 1.6

