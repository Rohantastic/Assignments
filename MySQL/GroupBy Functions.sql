-- 1. Display the minimum Status in the Supplier table.
	select min(status) as minimum from suppliers;
    
-- 2. Display the maximum Weight in the Parts table.
		select max(weight) as maximum  from parts;
        
-- 3. Display the average Weight of the Parts.
	select avg(weight) as average from parts;
    
-- 4. Display the total Quantity sold for part ‘P1’.
	select qty from orders where pnum=1;
    
-- 5. Display the total Quantity sold for each part.
	select Pname, Qty
    from parts join orders using(PNUM);

-- 6. Display the average Quantity sold for each part.
	select avg(Qty) from orders where
		
-- 7. Display the maximum Quantity sold for each part, provided the maximum Quantity is  greater than 800.
   
   SELECT max(qty) as maxof
   from orders group by pnum having maxof >= 400;

-- 8. Display the Status and the count of Suppliers with that Status.
	select status, count(status) from suppliers group by status;
    
-- 9. Display the count of Projects going on in different cities.
	
    select distinct count(city) as projects from parts inner join suppliers using(CITY);

-- 10. What is the difference between COUNT(Status) and COUNT(*) ?
	-- count(status) will count the number of entries in status column
    -- where  count(*) will count the max number of entries any column in the table has.

-- 11. Display the Status and the Count of Suppliers with that Status in the following format  as shown below:- Status Count

  select status , count(sname)
    from suppliers group by status;
