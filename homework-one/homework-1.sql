create table student(
id serial primary key,
firstName varchar(20) not null,
lastName varchar(30) not null,
dateOfBirth date,
enrolledDate date,
gender varchar(15),
nationalIDNumber integer not null,
studentCardNumber integer not null
);

insert into student (firstname, lastname, dateofbirth, enrolleddate, gender, nationalidnumber, studentcardnumber)
values 
('Amy', 'Thyst', '1997.10.23', '2023.10.10', 'female', 3356, 6743),
('Aqua', 'Marine', '1993.11.18', '2023.10.10', 'female', 2214, 7894);


create table teacher(
id serial primary key, 
firstName varchar(20) not null,
lastName varchar(30) not null,
dateOfBirth date not null,
academicRank varchar(20) not null,
hireDate date not null
);

insert into teacher (firstname, lastname, dateofbirth, academicrank, hiredate)
values 
('Emmy', 'Rald', '1990.03.23', 'proffesor', '2022.01.15'),
('Ruby', 'Burger', '1994.12.01', 'proffesor', '2021.03.20');

alter table student add column teacher_id integer;
alter table student add foreign key (teacher_id) references teacher(id);

select s.*, t.*
from student s
inner join teacher t on s.teacher_id = t.id;


create table grade_details(
id integer not null,
gradeID integer not null,
achievementTypeID integer not null,
achievementPoints integer not null,
achievementMaxPoints integer not null,
achievementDate date
);

create table course(
id integer,
name varchar(50) not null,
credit integer not null,
academicYear date,
semester varchar(10) not null
);

alter table course add constraint course_id_unique unique (id);

insert into course (id, name, credit, academicyear, semester)
values (1, 'Basic Javascript', 10, '2023.10.16', 'Fall');

insert into course(id, name, credit, academicyear, semester)
values
(2, 'Advanced Javascript', 10, '2024.01.15', 'Winter'),
(3, 'Basic NodeJS', 10, '2024.02.15', 'Winter' );


create table grade(
id integer not null,
studentID integer not null,
courseID integer not null, 
teacherID integer not null,
grade smallint not null,
comment varchar(100) not null,
createdDate date
);

alter table grade add constraint pk_grade primary key (id);
alter table grade add constraint fk_student_grade foreign key (studentID) references student(id);
alter table grade add constraint fk_course_grade foreign key (courseID) references course(id);
alter table grade add constraint fk_teacher_grade foreign key (teacherID) references teacher(id);

insert into grade (id, studentid, courseid, teacherid, grade, "comment", createddate)
values( 1,1,3, 2, 80, 'Good job', '2024.01.20');

create table achievement_type(
id integer not null,
name varchar(100) not null,
description text not null,
participationRate integer not null
);
