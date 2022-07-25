use olympicdb; # name of the database that contains all the tables

#1 Find the average number of medals won by each country
select country,avg(total_medal) from (select * from person
natural join country) as temp4
group by country;


#2 Display the countries and the number of gold medals they have won in decreasing order

select country, sum(gold_medal) `total gold` from (select * from person
natural join country) as temp4
group by country
order by (`total gold`) desc;


#3 Display the list of people and the medals they have won in descending order, grouped by their country

select name, sum(total_medal) as medals, country from (select * from person
natural join country) as temp4
group by name
order by country desc, medals desc;

#4 Display the list of people with the medals they have won according to their age

select name, sum(total_medal) as medals, age from person
group by name
order by age;

#5 Which country has won the most number of medals (cumulative)

select country, sum(total_medal) as `Total Medals` from (select * from person
natural join country) as temp4
GROUP BY country
order by `Total Medals` desc
limit 1;