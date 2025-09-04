create database movie_bookings;
use movie_bookings;

 -- create table structure
create table users (userid int primary key,firstname varchar(50),email varchar(100) unique);

create table movies (movieid int primary key,title varchar(100),durationminutes float);

create table theaters (theaterid int primary key,theatername varchar(100),city varchar(50));

create table screens (screenid int primary key,theaterid int,screenname varchar(20),totalseats int,
    foreign key (theaterid) references theaters(theaterid));

create table seats (seatid int primary key,screenid int,seatrow varchar(5),seatnumber int,
    unique key (seatnumber),foreign key (screenid) references screens(screenid));

create table shows (showid int primary key,movieid int,screenid int,showtime datetime,price decimal(10, 2),availableseats int,
    foreign key (movieid) references movies(movieid),foreign key (screenid) references screens(screenid));

create table bookings (bookingid int primary key,userid int,showid int,totalamount decimal(10, 2),bookingtime timestamp default current_timestamp,
    foreign key (userid) references users(userid),foreign key (showid) references shows(showid));


-- data insertion

insert into users (userid, firstname, email) values(1, 'aarav', 'aarav@example.com'),
													(2, 'sneha', 'sneha@example.com'),
													(3, 'rahul', 'rahul@example.com'),
													(4, 'meera', 'meera@example.com'),
													(5, 'karan', 'karan@example.com'),
													(6, 'anjali', 'anjali@example.com'),
													(7, 'vikram', 'vikram@example.com'),
													(8, 'riya', 'riya@example.com'),
													(9, 'dev', 'dev@example.com'),
													(10, 'priya', 'priya@example.com');
select * from users;
select * from users where userid = 4;
select * from users having userid = 4;

insert into movies (movieid, title, durationminutes) values(1, 'inception', 148),
															(2, 'the matrix', 136),
															(3, 'interstellar', 169),
															(4, 'avengers: endgame', 181),
															(5, 'kgf chapter 2', 168),
															(6, 'pathaan', 146),
															(7, 'pushpa', 179),
															(8, 'jawan', 171),
															(9, '3 idiots', 170),
															(10, 'dangal', 161);

insert into theaters (theaterid, theatername, city) values(1, 'pvr cinemas', 'delhi'),
															(2, 'inox', 'mumbai'),
															(3, 'cinepolis', 'bangalore'),
															(4, 'carnival', 'hyderabad'),
															(5, 'sathyam cinemas', 'chennai'),
															(6, 'asian cinemas', 'hyderabad'),
															(7, 'e-square', 'pune'),
															(8, 'luxe cinemas', 'chennai'),
															(9, 'city pride', 'pune'),
															(10, 'miraj cinemas', 'delhi');
  
insert into screens (screenid, theaterid, screenname, totalseats) values(1, 1, 'screen 1', 100),
																		(2, 1, 'screen 2', 80),
																		(3, 2, 'screen 1', 90),
																		(4, 2, 'screen 2', 70),
																		(5, 3, 'screen a', 120),
																		(6, 4, 'screen x', 150),
																		(7, 5, 'screen s1', 100),
																		(8, 6, 'screen z', 110),
																		(9, 7, 'screen 3', 60),
																		(10, 8, 'screen 4', 95);

insert into seats (seatid, screenid, seatrow, seatnumber) values(1, 1, 'a', 101),
																(2, 2, 'b', 102),
																(3, 3, 'c', 103),
																(4, 4, 'd', 104),
																(5, 5, 'e', 105),
																(6, 6, 'f', 106),
																(7, 7, 'g', 107),
																(8, 8, 'h', 108),
																(9, 9, 'i', 109),
																(10, 10, 'j', 110);

insert into shows (showid, movieid, screenid, showtime, price, availableseats) values(1, 1, 1, '2025-08-05 18:30:00', 250.00, 90),
																					(2, 2, 2, '2025-08-05 21:00:00', 220.00, 75),
																					(3, 3, 3, '2025-08-06 14:00:00', 300.00, 80),
																					(4, 4, 4, '2025-08-06 17:30:00', 280.00, 60),
																					(5, 5, 5, '2025-08-07 13:00:00', 200.00, 100),
																					(6, 6, 6, '2025-08-07 20:00:00', 180.00, 130),
																					(7, 7, 7, '2025-08-08 12:00:00', 210.00, 90),
																					(8, 8, 8, '2025-08-08 15:30:00', 260.00, 100),
																					(9, 9, 9, '2025-08-08 18:00:00', 150.00, 50),
																					(10, 10, 10, '2025-08-09 19:00:00', 230.00, 85);

insert into bookings (bookingid, userid, showid, totalamount) values(1, 1, 1, 500.00),
																	(2, 2, 2, 220.00),
																	(3, 3, 3, 600.00),
																	(4, 4, 4, 560.00),
																	(5, 5, 5, 400.00),
																	(6, 6, 6, 540.00),
																	(7, 7, 7, 420.00),
																	(8, 8, 8, 520.00),
																	(9, 9, 9, 300.00),
																	(10, 10, 10, 460.00);

-- data updates and deletions 

update users set firstname = 'raghav' where userid = 3;
update users set email = 'vikram.singh@example.com' where userid = 7;
update movies set durationminutes = 150 where movieid = 1;
update movies set title = 'pathaan: reloaded' where movieid = 6;
update theaters set theatername = 'carnival deluxe' where theaterid = 4;
update theaters set city = 'nagpur' where theaterid = 9;
update screens set screenname = 'platinum 1' where screenid = 3;
update screens set totalseats = 160 where screenid = 6;
update seats set seatrow = 'z' where seatid = 5;
update seats set seatnumber = 120 where seatid = 10;
update shows set price = 240.00 where showid = 2;
update shows set availableseats = 85 where showid = 7;
update bookings set totalamount = 620.00 where bookingid = 3;
update bookings set bookingtime = '2025-08-04 10:30:00' where bookingid = 6;

delete from bookings where bookingid in (1, 2);
delete from seats where seatid in (1, 2);
delete from theaters where theaterid in (9, 10);
delete from users where userid in (1, 2);

--  alter

alter table bookings modify bookingid int auto_increment;
alter table seats drop index seatnumber;
alter table seats add unique key `uk_seat_per_screen` (screenid, seatrow, seatnumber);

set foreign_key_checks = 0;
alter table users modify userid int auto_increment;
alter table users modify firstname varchar(50) not null;
alter table movies modify movieid int auto_increment;
alter table theaters modify theaterid int auto_increment;
set foreign_key_checks = 1;


-- data queries dql

select * from movies where durationminutes > 146;
select movieid from movies where title="jawan";
select * from theaters where city = 'chennai' order by theatername asc;

-- count the number of screens in each theater.
select theaterid, count(screenid) as numberofscreens from screens group by theaterid;

-- filter groups to find theaters with more than 1 screen.
select theaterid, count(screenid) as numberofscreens from screens
group by theaterid having count(screenid) > 1;

select * from bookings where userid in (
    select userid from users where firstname in ('riya', 'priya'));

select * from shows where showtime between '2025-08-06' and '2025-08-08';
select * from movies where title like 'p%';
select firstname, email from users where email like '%example.com';
select upper(theatername) as uppercasename from theaters;
select showid, round(price) as roundedprice from shows;
select * from bookings where date(bookingtime) = curdate();
select showid, hour(showtime) as hourofshow from shows;

-- calculate total earnings per movie title.
select m.title, sum(b.totalamount) as totalearnings from bookings b
join shows s on b.showid = s.showid
join movies m on s.movieid = m.movieid
group by m.title;

-- get the average price of all shows.
select avg(price) as avgshowprice from shows;

-- format the booking amount with a currency symbol.
select bookingid, concat('₹', format(totalamount, 2)) as amount from bookings;

-- list all movies and count their shows, including movies with 0 shows.
select m.title, count(s.showid) as numberofshows from movies m
left join shows s on m.movieid = s.movieid
group by m.title;

-- find pairs of theaters that are in the same city.
select t1.theatername, t2.theatername, t1.city from theaters t1
join theaters t2 on t1.city = t2.city and t1.theaterid < t2.theaterid;

-- stored procedures 
-- To get show details.
delimiter $$
create procedure sp_getshowdetails(in p_showid int, out p_availableseats int, out p_price decimal(10, 2))
begin
    select availableseats, price into p_availableseats, p_price from shows where showid = p_showid;
end$$
delimiter ;

call sp_getshowdetails(3, @seats, @price);
select @seats as availableseats, @price as priceperticket;

-- To create a new booking record.
delimiter $$
create procedure sp_addbookingrecord(in p_userid int, in p_showid int, in p_totalcost decimal(10, 2), out p_newbookingid int)
begin
    insert into bookings(userid, showid, totalamount) values (p_userid, p_showid, p_totalcost);
    set p_newbookingid = last_insert_id();
end$$
delimiter ;

set foreign_key_checks=0;

call sp_addbookingrecord(12, 5, 600.2, @newbooking);
select @newbooking; 

set foreign_key_checks=1; 

-- To update the seat count after a booking.
delimiter $$
create procedure sp_updateseatcount(in p_showid int, in p_numberoftickets int)
begin
    update shows set availableseats = availableseats - p_numberoftickets where showid = p_showid;
end$$
delimiter ;

call sp_updateseatcount(5, 1);

-- the finall booking logic .
delimiter $$
DROP PROCEDURE IF EXISTS sp_processnewbooking;
create procedure sp_processnewbooking(in p_userid int, in p_showid int, in p_numberoftickets int)
begin
    declare v_availableseats int;
    declare v_priceperticket decimal(10, 2);
    declare v_totalcost decimal(10, 2);
    declare v_newbookingid int;
    
    call sp_getshowdetails(p_showid, v_availableseats, v_priceperticket);

    if v_availableseats >= p_numberoftickets then
        -- start transaction to check steps succeed or not
        start transaction;
				set v_totalcost = v_priceperticket * p_numberoftickets;
		
				call sp_addbookingrecord(p_userid, p_showid, v_totalcost, v_newbookingid);
		
				call sp_updateseatcount(p_showid, p_numberoftickets);
        commit;
        select 'booking successful! your booking id is:', v_newbookingid as your_book_id;
    else
        select 'not enough seats available.' as Status_of_booking;
    end if;
end$$
delimiter ;


call sp_processnewbooking(4, 5, 2);