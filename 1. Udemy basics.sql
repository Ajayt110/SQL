CREATE TABLE sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE DEFAULT NULL,
    customer_id INT DEFAULT NULL,
    item_code VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (purchase_number)
);


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);
 
CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number NUMERIC(12),
    PRIMARY KEY (company_id)
);

CREATE TABLE ITEMS (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255)
);
 
 
drop table sales;

drop table customers;

drop table items;

drop table companies;

alter table sales 
drop constraint sales_ibfk_1;

alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;

alter table customers
add unique key (email_address);

alter table customers
drop index email_adress;

alter table customers
add column gender enum('M','F') after last_name;

insert into customers values(1,'John','Mackinley','M','John.M@mail.com',0);

select * from customers;

ALTER table companies
modify company_name varchar(255) not null;

ALTER table companies
modify headquarters_phone_number numeric(12) not null;

#also works for commentinhg
/* for multiline comments*/

select * from companies;