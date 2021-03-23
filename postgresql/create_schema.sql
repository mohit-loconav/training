create table regions (
region_id int primary key,
region_name varchar(25)
);

create table jobs (
job_id int primary key,
job_title varchar(35),
min_salary numeric(8,2),
max_salary numeric(8,2)
);

create table countries (
country_id char(2) primary key,
country_name varchar(40),
region_id int,
foreign key (region_id) references regions(region_id)
);

create table locations (
location_id int primary key,
street_address varchar(40),
postal_code varchar(12),
city varchar(30),
state_province varchar(25),
country_id char(2),
foreign key (country_id) references countries(country_id)
);

create table departments (
department_id int primary key,
department_name varchar(30),
location_id int,
foreign key (location_id) references locations(location_id)
);

create table employees (
employee_id int primary key,
first_name varchar(20),
last_name varchar(25),
email varchar(100),
phone_number varchar(20),
hire_date DATE,
job_id int,
salary numeric(8,2),
manager_id int,
department_id int,
foreign key (job_id) references jobs(job_id),
foreign key (manager_id) references employees(employee_id),
foreign key (department_id) references departments(department_id)
);

create table dependents (
dependent_id int primary key,
first_name varchar(50),
last_name varchar(50),
relationship varchar(25),
employee_id int,
foreign key (employee_id) references employees(employee_id)
);