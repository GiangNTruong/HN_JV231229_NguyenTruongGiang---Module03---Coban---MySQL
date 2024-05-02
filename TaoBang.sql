create database hackthon1;
use hackthon1;
create table if not exists Student(
    studentId varchar(4) primary key not null ,
    studentName varchar(100) not null ,
    birthday date not null ,
    gender bit(1) not null ,
    address text not null ,
    phoneNumber varchar(45)

);
create table if not exists Subject(
    subjectId varchar(4) primary key not null ,
    subjectName varchar(45) not null ,
    priority int(11) not null
);
create table if not exists Mark(
    subjectId varchar(4) not null ,
    studentId varchar(4) not null ,
    point float not null
);

alter table Mark
add foreign key (subjectId) references Subject(subjectId),
    add foreign key (studentId) references Student(studentId);