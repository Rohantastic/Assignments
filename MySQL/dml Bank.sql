use bank;
desc branch;
-- 1. Update all Branch_id where referred as BR in place of B
    --    eg: B00001 will become BR_00001
alter table branch
modify bid VARCHAR(10); 
update branch
set bid = replace(bid, "B", "BR_");

    
-- 2. For testing purpose create a copy of tran_detail table and use bulk insert to load 1 million records to it. Please make necessary arrangement to generate new TRAN_ID for each record
create table transaction_detail like tran_detail;
desc transaction_detail;

alter table transaction_detail
modify tnumber int(6) not null auto_increment;



-- 3. Update Transaction type and medium of transaction values to upper case for all records of transaction table.
select * from tran_detail;
update tran_detail
set medium_of_transaction = upper(medium_of_transaction),
	transaction_type = upper(transaction_type);

-- 4. Update phone number and base location of customer Abhishek (C00009) to 8976523191 and Pune
select * from customer;
update customer
set mobileno = '8976523191',
	city = 'Pune'
    where custid="c00009";

-- 5. Add a new column customer_cnt to Branch table and update it's value based on count of customer that branch has.
alter table branch
add customer_cnt int;
update branch
set customer_cnt = (select count(*) from `account` group by bid having account.bid = branch.bid);

-- 6. Create a new table account_bak and copy all records of account table to account_bak
create table account_bak select * from account;
select * from account_bak;
-- 7. Update the account status as Inavtive for account of customer 'Amit Kumar Borkar'
update account_bak set astatus = "inactive" where custid = ( select custid from customer where fname = "amit");
-- 8. Add a new transaction to account for all loan account customers as one time charge of 1000 Rs for current month.
select * from loan;
update loan
set loan_amount = (loan_amount + 1000);


