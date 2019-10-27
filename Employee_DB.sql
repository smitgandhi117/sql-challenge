create table departments (
    dept_no varchar(10)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

create table dept_emplyoee(
emp_no int,
dept_no varchar(20) not null,
from_date varchar(20) not null,
to_date varchar(20) not null
);

create table dept_manager(
dept_no varchar(10) not null,
emp_no int not null,
from_date varchar(20) not null,
to_date varchar(20) not null
);

create table employees(
emp_no int not null,
birth_date varchar(20) not null,
first_name varchar(30) not null, 
last_name varchar(30) not null,
gender char not null,
hire_date varchar(30)  not null,
CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no")
);

create table salaries(
emp_no int not null,
salary int not null,
from_date varchar(30) not null,
to_date varchar(30) not null
);

create table titles(
emp_no int not null,
title varchar(30) not null,
from_date varchar(30) not null, 
to_date varchar(30) not null
);

--1
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees, salaries
where employees.emp_no = salaries.emp_no;

--2
select employees.hire_date
from employees
where employees.hire_date like '1986%';

--3
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments as d
inner join dept_manager as dm on
dm.dept_no = d.dept_no
join employees as e on
e.emp_no = dm.emp_no;

--4
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d
order by d.dept_name;

--5
select e.last_name, e.first_name
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%';

--6
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d
where d.dept_name = 'Sales';

--7
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--8
select e.last_name, count(e.last_name) as freq
from employees as e
group by e.last_name
order by e.last_name desc;
