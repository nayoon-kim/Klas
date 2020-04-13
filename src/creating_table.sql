use test_schema;

create table courses (
courseName VARCHAR(200),
semester VARCHAR(200),
unit int,
courseNum VARCHAR(200)
);

select * from courses;
create table lecture (
title VARCHAR(200),
_update VARCHAR(200),
_view int,
_upno int,
content VARCHAR(200),
CUrl VARCHAR(200),
CFName VARCHAR(200),
scetionID VARCHAR(200)
);
select * from lecture;

create table professor (
professorName VARCHAR(200),
professorID VARCHAR(200),
professorEmail VARCHAR(200),
professorPhone VARCHAR(200),
professorPassword VARCHAR(200));

select * from professor;

create table section (
Secid VARCHAR(200),
Pid VARCHAR(200),
Semester VARCHAR(200),
year VARCHAR(200),
Courseid VARCHAR(200),
Building VARCHAR(200),
Roomnum VARCHAR(200),
schedule VARCHAR(200),
coursename VARCHAR(200));

select * from section;

create table student(
studentName VARCHAR(200),
studentID VARCHAR(200),
studentEmail VARCHAR(200),
studentPassword VARCHAR(200),
studentDepartment VARCHAR(200),
studentPhone VARCHAR(200),
studentGrade int);

select * from student;

create table takes(
takesID VARCHAR(200),
sectionID VARCHAR(200),
studentID VARCHAR(200));

create table user(
userID VARCHAR(200),
userPassword VARCHAR(200));
