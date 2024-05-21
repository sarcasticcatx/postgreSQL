--1.show all details from before 01-04-1992
select * from artist_details ad 
where ad.date_of_birth < '1992-04-01';

--2.showl all details for artists from germany
select * from artist_details ad 
where ad.country = 'Germany';

--3.show all songs longer than 4 minutes
select * from song s
where s.duration > '4 minutes';

--4.show all explicit songs
select * from song s 
where s.explicit = true;

--5.show all genres having o in their name
select * from genre g 
where g."name" like '%o%';

--6.show all lyrics that has the word 'that'
select * from song_lyrics sl 
where sl.lyrics like '%that%';

--7.show all details from artists that have 'e' in their full name , ordered by date of birth by the oldest
--to the youngest
select * from artist_details ad 
where ad.full_name like '%e%'
order by ad.date_of_birth asc ;

--not-important ali alex turner ne e roden definitivno u 2002
update artist_details 
set date_of_birth = '1986-01-06'
where id = 30;

--8.show all non-exolicit songs sorted by duration from shortest to longest
select * from song s 
where s.explicit = false 
order by s.duration asc ; --zaso gi ima po dva tri pati so razlichni id-nja? 

--9.show albums that have 'u' in their name sorted by rating , with worst rating on top
select * from album a 
where a."name" like '%u%'
order by a.rating asc;

--10.list all artists name and artist full names without duplicates
select name from artist a
union
select ad.full_name from artist_details ad ; 

--11.list all aritsts name and full name with duplicates
select name from artist a
union all
select ad.full_name from artist_details ad ; 

--12.list all commont artist names and artist full names
select name from artist a 
intersect
select ad.full_name from artist_details ad ;

--13.show all albums names and its rating
select name, rating from album;

--14.show all artist with their name and full name side by side
select a.name, ad.full_name
from artist a 
inner join artist_details ad on a.id = ad.id ;

--15.shwo all songs with their lyrics side by side
select s.name, sl.lyrics
from song s 
inner join song_lyrics sl on s.id = sl.id;

--16.shwo artist with album names siby by side
select a.name, a2.name
from artist a 
inner join album a2 on a.id = a2.id;

--17.show the artist names and their spouse name for all artist including ones that dont have details
select a.name, ad.spouse_name 
from artist a
left join artist_details ad on a.id = ad.id ; --i right join mi gi dava istite rezultati

--18.show artist names and list of countries for all, including missing artist and missing details info
select a.name, ad.country
from artist a 
full outer join artist_details ad on a.id = ad.id;


--19.list all song names with genre names
select s.name , g.name 
from song s 
join genre g on s.id = g.id ;

--20.list all sobg names with playlist names
select s.name , p.title 
from song s 
join playlist p on s.id = p.id;

--21.list all album names and rating that have rating above 4 with the artust name
select a2.name ,a.name
from album a2
join artist a on a2.id = a.id 
where a2.rating > 4;

--22.list all explicit songs names and aartist names without missing data
select s.name , a.name
from song s 
full join artist a on a.id = s.id 
where s.explicit = true;

select s.name, a.name
from song s 
cross join artist a 
where s.explicit  = true;

