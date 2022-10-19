-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns.

select backers_count, cf_id, outcome
from campaigns 
where outcome='live' order by backers_count desc;

/* 
3640	65	"live"
1111	1572	"live"
1089	563	"live"
808	968	"live"
708	1114	"live"
278	238	"live"
211	1911	"live"
86	948	"live"
66	910	"live"
61	2284	"live"
45	2882	"live"
31	3138	"live"
27	2488	"live"
14	2510	"live" 
*/

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select count(backer_id) as num_of_backers, cf_id 
from backers_info 
group by cf_id 
order by num_of_backers desc;

/*
3640	65
1111	1572
1089	563
808	968
708	1114
278	238
211	1911
86	948
66	910
61	2284
45	2882
31	3138
27	2488
14	2510
*/

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

select first_name, last_name, emails, (goal - pledged) as amt_to_goal
INTO live_campaign_contacts
from campaigns c
join contacts co
on c.contact_id=co.contact_id
where outcome='live'
order by amt_to_goal desc;

/*
"Calogero"	"Cross"	"calogero.cross@mercantini.it"	153288
"Lauretta"	"Neal"	"lauretta.neal@hotmail.de"	151747
"Chantal"	"Armas"	"chantal.armas@jenkins.net"	98164
"Ariadna"	"Geisel"	"ariadna.geisel@rangel.com"	88154
"Mathilde"	"Kruschwitz"	"mathilde.kruschwitz@yahoo.com"	72323
"Guillermina"	"Nicholson"	"guillermina.nicholson@grondin.fr"	71872
"Henry"	"Gucci"	"henry.gucci@leleu.fr"	41198
"Gabriela"	"Padilla"	"gabriela.padilla@pearson-russell.com"	40291
"Svenja"	"Perrin"	"svenja.perrin@berger.com"	8362
"Caroline"	"Reeves"	"caroline.reeves@yahoo.com"	3768
"Katarina"	"Clarke"	"katarina.clarke@hotmail.com.au"	3739
"Imelda"	"Guerin"	"imelda.guerin@stumpf.net"	1559
"Danny"	"Farrell"	"danny.farrell@hotmail.com"	1503
"Tobias"	"Carbajal"	"tobias.carbajal@live.com"	426
*/


-- Check the table
select * from live_campaign_contacts;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

select b.emails, b.first_name, b.last_name, b.cf_id,  c.company_name, c.description, c.end_date, (goal - pledged) as amt_to_goal
INTO email_backers_remaining_goal_amount
FROM campaigns c
join backers_info b
on c.cf_id=b.cf_id
where outcome='live'
--order by amt_to_goal desc
;


-- Check the table
select * from email_backers_remaining_goal_amount limit 10;


