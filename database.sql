create table admin(username varchar(255) not null, password varchar(255) not null);

create table reg(rno int primary key, name varchar(255),email varchar(255), pass varchar(255), pno varchar(255), address varchar(255));

create table book(bno varchar(10) primary key, subject varchar(255), title varchar(255), author varchar(255), price int, qty int);

create table bill(email varchar(255), password varchar(255), bno varchar(255));

create table record(rno int, name varchar(255), email varchar(255), pno varchar(20), address varchar(255), bno varchar(10), title varchar(255), author varchar(255), price int, d varchar(40));

