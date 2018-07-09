create database student;

use student;

create table student
(
id varchar(8) primary key,
name varchar(255) default null,
gender varchar(255) default null,
birthday date default null,
address varchar(255) default null
);

create table user
(
id int primary key auto_increment,
username varchar(255) not null,
password varchar(255) not null
);
insert into student values('S0000001', '张三丰', '男', '2015-06-24', '武当山');
insert into student values('S0000002', '张无忌', '男', '2015-06-24', '武当山');
insert into student values('S0000004', '李白', '女', '2015-06-06', '西安长安区');

insert into user values(null, '张三', '123456');
