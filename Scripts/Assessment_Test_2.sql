-- Assessment Test 2 : Need to restore data using command -> pg_restore -U abbas -d exercises --no-owner exercises.tar

-- 1. How can you retrieve all the information from the cd.facilities table?
select * from cd.facilities;

-- 2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
select * from cd.facilities;
select name,membercost from cd.facilities;

-- 3. How can you produce a list of facilities that charge a fee to members
select * from cd.facilities;
select * from cd.facilities where membercost > 0;

-- 4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
--    Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
select * from cd.facilities;
select facid, name, membercost, monthlymaintenance from cd.facilities where membercost > 0 and membercost < (monthlymaintenance / 50);

-- 5. How can you produce a list of all facilities with the word 'Tennis' in their name?
select * from cd.facilities;
select * from cd.facilities where name like '%Tennis%';

-- 6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
select * from cd.facilities;
select * from cd.facilities where facid in(1,5);

-- 7. How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and 
--    joindate of the members in question.
select * from cd.members;
select memid, surname, firstname, joindate from cd.members where joindate >= '2012-09-01';

-- 8. How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
select * from cd.members;
select distinct surname from cd.members order by surname limit 10;

-- 9. You'd like to get the signup date of your last member. How can you retrieve this information?
select * from cd.members;
select joindate from cd.members order by joindate desc limit 1;
select MAX(joindate) from cd.members;

-- 10. Produce a count of the number of facilities that have a cost to guests of 10 or more.
select * from cd.facilities;
select COUNT(*) from cd.facilities where guestcost >= 10;

-- 11. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, 
--     sorted by the number of slots.
select * from cd.bookings;
select facid, SUM(slots) from cd.bookings where starttime >= '2012-09-01' and starttime <= '2012-10-01' group by facid order by SUM(slots);

-- 12. Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
select * from cd.bookings;
select facid, SUM(slots) from cd.bookings group by facid having SUM(slots) > 1000 order by facid;

-- 13. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
--     Return a list of start time and facility name pairings, ordered by the time.
select * from cd.facilities;
select * from cd.bookings;
select starttime, name from cd.facilities inner join cd.bookings on cd.bookings.facid = cd.facilities.facid where name like 'Tennis Court%' 
and starttime >= '2012-09-21' and starttime < '2012-09-22' order by starttime;

select starttime, name from cd.facilities inner join cd.bookings on cd.bookings.facid = cd.facilities.facid where cd.facilities.facid in(0,1) 
and starttime >= '2012-09-21' and starttime < '2012-09-22' order by starttime;

-- 14. How can you produce a list of the start times for bookings by members named 'David Farrell'?
select * from cd.bookings;
select * from cd.members;
select starttime from cd.members inner join cd.bookings on cd.members.memid = cd.bookings.memid where firstname ='David' and surname='Farrell';
---------------------------------------------------------------------------------------------------------------------------------------------------------