select * from ipl;

#1) which player has won the highest man of the match?
select player_of_match,count(*) as topplayer 
from ipl 
group by player_of_match 
order by count(*)
desc limit 1;

#2) list out top 10 players with most man of the match?
select player_of_match,count(*) as topplayer 
from ipl 
group by player_of_match 
order by count(*)
desc limit 10;

#3) Which team has won the most number of matches?
select winner, count(*) as top_win from ipl
group by winner 
order by count(*)
desc limit 1;

#4) Find out the number of matches each team has won so far?
select winner, count(*) as win from ipl
group by winner 
order by count(*)
desc ;

#5) List out all the ground with total number of matches played each of them?(stadium-Total match)
select venue,count(*) as Stad_all_matches 
from ipl 
group by venue 
order by count(*) desc;

#6) List out the top 10 umpires who have stood in most of matchs?
select concat(umpire1, umpire2,umpire3) as ump,count(*) as most_stood 
from ipl 
group by ump
order by count(*) desc limit 10;

#7) List out top umpires who have stood the most umpire 1 ?
SELECT umpire1, COUNT(*) AS ump_1
FROM ipl
GROUP BY umpire1
ORDER BY ump_1 DESC;

#8) List out top umpires who have stood the most umpire 2 ?
select umpire2,count(*) as upm2 
from ipl 
group by umpire2 
order by count(*) desc ;

#9) Find out the name of every who has been a third umpire along with the number of matches?
SELECT umpire3 , COUNT(*) AS number_of_matches 
FROM ipl 
WHERE umpire3 IS NOT NULL 
GROUP BY umpire3;

#10) Find out unique toss decision that have been taken by captain? (howmany times fielding & bating)
select toss_decision,count(*) as unique_decision 
from ipl group by toss_decision;

#11) Find out the list of unique results of matches?(win,tie,no result)
SELECT result, COUNT(*) AS unique_result_total
FROM ipl
GROUP BY result;

#12) Find out all the team names who have won matches with more than 50 matches?
select 
winner, count(*) as won
from ipl
group by winner
having count(*) >50;

#13) Find out which team has won how many matches who first won the toss? 

