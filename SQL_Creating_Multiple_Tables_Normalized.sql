-- Introduction

-- This is a historical dataset on the Olympic Games, including all the Games from 2000 to 2012 in which thousands of athletes from around the world participate in a variety of competitions. The Olympic Games are considered the world’s foremost sports competition with more than 100 nations participating. The total number of sports in this Olympics dataset is 49 and for every event there are winners. It includes the name of the player, country, medals won and year of the olympics

-- Data Description

-- 8618 observations with 10 variables

-- name: Name of the Player
-- age: Age of the Player
-- country: Name of the Player's Country 
-- year: year of the olympics
-- Date_Given: Date of the event
-- sports: Name of the sport in which the player participated
-- gold_medal: No of gold medals player won
-- silver_medal: No of silver medals player won
-- bronze_medal: No of bronze medals player won
-- total_medal: Total no of medals player won

-- ---------------------------------------------------------------------------------------------------------------------------
use olympicdb; # olympicdb is the database name

select * from master_tb; # master_tb is the original olympic dataset

--
-- Creating a Table  `country` with a new primary key column cn_id. This table consists names of the countries
--

CREATE table country(cn_id int not null AUTO_INCREMENT,
country VARCHAR(50),
primary key(cn_id)
); #creating a new table

ALTER TABLE country AUTO_INCREMENT=100; # using this statement so that the country id starts from 100 and increments by 1

insert into country (country)
select distinct country
from master_tb; #inserting the distinct value of country and each value is assigned to country id which will be referred later in the person table

select * from country; # viewing the created country table

--
-- Creating a Table  `year` with a new primary key column yr_id. This table consists all years of olympic
--

CREATE table year(yr_id int not null AUTO_INCREMENT,
year int,
date DATE,
primary key(yr_id)
); #creating a new table

ALTER TABLE year AUTO_INCREMENT=500; # using this statement so that the yr_id starts from 500 and increments by 1

insert into year (year, date)
select distinct year, Date_Given
from master_tb; #inserting the distinct value of year, date given and each value is assigned to location id which will be referred later in the person table

select * from year; # viewing the created year table

--
-- Creating a Table  `sports` with a new primary key column sprt_id. This table consists of all the sports in the olympics
--

CREATE table sports(sprt_id int not null AUTO_INCREMENT,
sports varchar(50),
primary key(sprt_id)
); #creating a new table

ALTER TABLE sports AUTO_INCREMENT=3000; # using this statement so that the sprt_id starts from 3000 and increments by 1

insert into sports(sports)
select distinct sports
from master_tb; #inserting the distinct value of sports and each value is assigned to sprt_id which will be referred later in the person table

select * from sports; # viewing the created sports table

--
-- Creating a Table  `person` which consists of winner name, age, medals won, and foreign keys cn_id(country ID), sprt_id(Sports ID), yr_id(Year ID)
--

create table person as (select name,age,gold_medal,silver_medal,brone_medal, total_medal, cn_id, sprt_id, yr_id from master_tb
natural join country
natural join sports
natural join year); # creating person table which contains the country, sports, and year id

--
-- Assigning the foreign keys
--

ALTER TABLE person
ADD FOREIGN KEY (sprt_id) REFERENCES sports(sprt_id);

ALTER TABLE person
ADD FOREIGN KEY (cn_id) REFERENCES country(cn_id);

ALTER TABLE person
ADD FOREIGN KEY (yr_id) REFERENCES year(yr_id);

