CREATE DATABASE IF NOT EXISTS bank;

USE BANK;
desc customer;
desc branch;
select * from branch;
select * from account;
select * from tran_detail;
select * from loan;

-- Customer table
-- 1. Customer id in customer table must be unique and does not allow null values
alter table customer 
add unique(custid); 
alter table customer
modify custid varchar(6) not null;

-- 2. Column fname must not allow space in it
alter table customer 
add constraint chknospace check(fname not like "% %");
-- 3. First name, middle name and last name must not be same
alter table customer
add unique (fname, mname, ltname);
-- 4. Age of customer (based on date of birth) must be more then 10 years old.
alter table customer
add constraint chkagegt10 check(dob < "2011-01-01");
-- Branch Table
-- 1. Branch name must not be null
alter table branch
modify bname varchar(30) not null;
-- 2. Branch id must be unique and not null
alter table branch
add unique (bid);
alter table branch
modify bid varchar(10) not null;
-- Account Table
-- 1. Account number for each record must be unique
alter table account
add unique(acnumber);
-- 2. Customer Id must be of valid customer and must not be left as blank
alter table account
add constraint fk_custid_cust_account foreign key(custid) references customer(custid);
alter table account
modify custid  VARCHAR(6) not null;
-- 3. opening balance must be more then 10000
alter table account
add constraint chk_ob_gt_10000 check(opening_balance > 1000);
-- 4. Acount opening date must not be of past dates
alter table account
add constraint chk_oad_not_past check(aod >= sysdate());
alter table account
drop constraint chk_oad_not_past;
-- 5. Branch id (bid) must be of valid branch 
alter table account
add constraint fk_bid_cust_branch foreign key(bid) references branch(bid) on delete cascade on update cascade;
alter table account
modify bid varchar(10);
desc account;
-- Tran_detail Table

-- 1. Transaction number must be unique for each transaction
alter table tran_detail
add unique(tnumber);
-- 2. Account number must refer to valid account

alter table tran_detail
add constraint fk_acnumber_tran_detail_account foreign key(acnumber) references account(acnumber);
-- Loan Table

-- 1. Customer Id must be of valid customer and must not be left as blank
alter table loan
modify custid VARCHAR(6) not null;
alter table loan
add unique(custid);
-- 2. Branch id (bid) must be of valid branch 
alter table loan
add constraint fk_bid_loan_branch foreign key(bid) references branch(bid) on delete cascade on update cascade;

-- 3. One customer can take only one loan for each loan type
alter table loan
add unique(custid, loan_type);


