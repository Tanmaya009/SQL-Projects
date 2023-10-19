select * from stank1;

ALTER TABLE stank RENAME COLUMN ï»¿EpNo. TO Ep;
select * from stank1;


 #1 Total no of episode that were telecasted in season1.
 select Ep.No, count(*) from stank1;
 
 #2 Find out the total no of pitches along with there name.
 SELECT SUM(male + female) AS total_sum FROM stank1;

 #3 Find out the total no of startup which got funding along with name.
 select brand,Amount_Invested_lakhs from stank1;

select brand,count(*) as top_brand from stank1
group by brand having Amount_Invested_lakhs > 0;
 
 #4 Find the total no of startups which did not get funding.
 SELECT COUNT(DISTINCT brand) AS total_brands_no_funding
FROM stank1
WHERE brand NOT IN (
    SELECT DISTINCT brand
    FROM stank1
    WHERE Amount_Invested_lakhs > 0);

 #5 Howmany % of startup got funding from the sharks.
 SELECT 
    (COUNT(CASE WHEN Amount_Invested_lakhs > 0 THEN 1 END) / COUNT(*)) * 100 AS Percentage
FROM stank1;

 #6 Find out the total no male participent from the season 1.
 select sum(male) as total_male from stank1;
 
 #7 What is the gender ratio.
 SELECT 
    COUNT(CASE WHEN Male = 'Male' THEN 1 END) AS MaleCount,
    COUNT(CASE WHEN Female = 'Female' THEN 1 END) AS FemaleCount,
    (COUNT(CASE WHEN Male = 'Male' THEN 1 END) / COUNT(*)) * 100 AS MaleRatio,
    (COUNT(CASE WHEN Female = 'Female' THEN 1 END) / COUNT(*)) * 100 AS FemaleRatio
FROM stank1;

 #8 Find out the total no of female participent from season 1.
  select sum(female) as total_female from stank1;

 #9 What is the total invested amount from season1.
 select sum(Amount_Invested_lakhs) from stank1;
 
 #10 What is the avg equity among all the deals that got funding.
 SELECT AVG(Equity_Taken) AS AverageEquity
FROM stank1
WHERE Deal IS NOT NULL;

 #11 Which startup recived highest deal.
SELECT brand
FROM stank1
GROUP BY brand
ORDER BY SUM(Amount_Invested_lakhs) DESC
LIMIT 1;
 
 #12 How many pitches have atleast one moment. 
 SELECT COUNT(*) AS PitchCount
FROM stank1
WHERE Male IS NOT NULL OR Female IS NOT NULL;

 #13 Howmany pitches got converted (got deal)which have atleast one moment.
 SELECT COUNT(*) AS PitchCount
FROM stank1
WHERE Deal IS NOT NULL AND (Male IS NOT NULL OR Female IS NOT NULL);

 #14 What is the avg. count the pitchers who have epresent in shark tank.
 SELECT AVG(Equity_Taken) AS AverageEquity
FROM stank1
WHERE Equity_Taken IS NOT NULL;

 #15 What was total equity taken from season 1.
 select sum(equity_taken) from stank1;
 
 #16 Avg. amount invested per deal.
 select avg(amount_invested_lakhs) from stank1;
  
 #17 What is the most common age among the enterpreneuor.
 SELECT avg_age
FROM stank1
GROUP BY avg_age
ORDER BY COUNT(*) DESC
LIMIT 1;
 
 #18 What was the most common location from which maximum no of pitches come in.
 select location 
 from stank1 
 group by location 
 order by count(*) desc limit 1 ;
 
 #19 From which sector most no of deals come from.
 SELECT Sector, COUNT(*) AS DealCount
FROM stank1
GROUP BY Sector
ORDER BY DealCount DESC
LIMIT 1;
 
 #20 Among the sharks who did the most no of deal together.
 select partners ,count(*) as most_deal
 from stank1 
 group by partners
 order by count(*) 
 desc limit 1;
 
 #21 Who did the list no of deals together.
  select partners ,count(*) as most_deal
 from stank1 
 group by partners
 order by count(*) 
 asc limit 1;
 
 #22 What is the indivisual among deal made by each shark.

 #23 Which start up got highest investment from each domain.
SELECT Sector,
MAX(Amount_Invested_lakhs) AS HighestInvestment
FROM stank1
GROUP BY Sector;

 #24 Find out name all the brand whos 3rd character is either c,b, or a and who got the deal.
 SELECT brand
FROM stank1
WHERE SUBSTRING(brand, 3, 1) IN ('c', 'b', 'a') AND deal > 0;

 #25 Find out all the start up who got and investment of multiple of 5 in lakhs.
 SELECT *
FROM stank1
WHERE Amount_Invested_lakhs % 5 = 0;

 #26 Find out name's of all the startups who excepted debt (loan) deal.
 SELECT brand
FROM stank1
WHERE Debt_Invested IS NOT NULL;

 #27 Find out name's of all the start up who received lone of less than 20 lakh.
 SELECT brand
FROM stank1
WHERE Debt_Invested < 20;

 #28 Find out names of all the start up who got dream deals.
 SELECT Brand
FROM stank1
WHERE Amount_Invested_lakhs = Amout_Asked;

 #29 find out all the start up who diluated(give of business) more then 5% of equity.
 SELECT brand
FROM stank1
WHERE Equity_Taken - Equity_Asked > 5;

 #30 find all name the startup who received offers from more than 3 sharks.
 SELECT Brand
FROM stank1
WHERE Total_investors > 3;

 #31 Find out name of all startup whos diluated less than 20% of business.
 SELECT brand
FROM stank1
WHERE Equity_Taken < 20;

 #32 Find out name of all the startups which had atleast 2 pitches.
SELECT male,female as pitches
FROM stank1
GROUP BY pitches
HAVING COUNT(*) >= 2;

 #33 Find out name of all startups who received deal from the shark and are based out of delhi.
 SELECT brand
FROM stank1
WHERE Location = 'Delhi' ;

 #34 Find out name of all startups in which the pitchers had more than 25 years of age.
 SELECT brand
FROM stank1
WHERE Avg_age > 25;

 #35 Find out name of all startups who diluated less than 1% and more then 0.1%.
 SELECT brand
FROM stank1
WHERE Equity_Taken > 0.1 AND Equity_Taken < 1;

 #36 What is the % of startups whos equity diluation multiple of three.
 SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM stank1)) AS Percentage
FROM stank1
WHERE Equity_Taken % 3 = 0;

 #37 what is the % of startups that got an invested by females sharks.
 SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM stank1)) AS Percentage
FROM stank1
WHERE Female IS NOT NULL;

 #38 What is the total no. of startups got an invested from atleast one male shark.  
 SELECT COUNT(DISTINCT brand) AS TotalStartups
FROM stank1
WHERE Male IS NOT NULL;

 #39 Find the total no. of start ups got an invested one male and on females.
 SELECT COUNT(DISTINCT brand) AS TotalStartups
FROM stank1
WHERE Male IS NOT NULL AND Female IS NOT NULL;

 #40 Find out the total no of startups that got investment from a shark who is not from there domain.
 SELECT COUNT(DISTINCT brand) AS TotalStartups
FROM stank1
WHERE Male IS NOT NULL AND Male NOT IN (SELECT Sector FROM stank1 WHERE brand = stank1.brand)
   OR Female IS NOT NULL AND Female NOT IN (SELECT Sector FROM stank1 WHERE brand = stank1.brand);

 #41-- Each of sharks howmany invested-( summary-sharkname, total invest amount, startup name)

