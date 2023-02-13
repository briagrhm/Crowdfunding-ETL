--Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT 
c.backers_count,
c.cf_id,
c.outcome
from campaign c
where 1=1
and (c.outcome = 'live')
order by c.backers_count DESC


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
--SELECT * from backers
SELECT COUNT(b.cf_id), b.cf_id
from backers b
GROUP BY b.cf_id
ORDER BY COUNT(b.cf_id) DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT c.first_name, 
c.last_name, 
c.email, 
(ca.goal - ca.pledged) as "Remaining Goal Amount"
into email_contacts_remaining_goal_amount
from contacts c
inner join campaign ca on (ca.contact_id=c.contact_id)
where 1=1
and (ca.outcome='live')
ORDER BY "Remaining Goal Amount" DESC;


DROP TABLE email_contacts_remaining_goal_amount;
-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.first_name, b.last_name, 
b.email,
c.cf_id, 
c.company_name, 
c.description,
c.end_date,
(c.goal-c.pledged) as "Left of Goal"
INTO "email_backers_remaining_goal_amount"
from campaign c
inner join backers b
on (c.cf_id = b.cf_id)
order by b.email DESC;


-- Check the table

SELECT * FROM "email_backers_remaining_goal_amount"