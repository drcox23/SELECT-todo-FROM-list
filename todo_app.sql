-- SQL queries for assignment

-- drop table todo_app
drop table todo_app;

--delete user michael
drop user michael

-- creaste user michael with password
create user michael
with password 'stonebreaker';

-- create database todo_app;
create database todo_app;

-- create table tasks;
create table tasks(
	id serial primary key,
	title varchar(225) not null,
	description text,
	created_at timestamp not null default now(),
	updated_at timestamp,
	completed boolean not null default false
);

-- drop column "completed"
alter table tasks
drop column completed;

-- add a column "completed_at" that may be Null
alter table tasks
add column completed_at timestamp default null;

-- modify column update_at to not allow Null values and have a default value of now();
alter table tasks
alter column updated_at set not null,
alter column updated_at set default now();

-- create a new task by setting values and not defining columns
insert into tasks
values (default,'Study SQL', 'Complete this exercise', now(), now(), null);

-- create a new task
insert into tasks (title, description)
values ('Study PostgreSQL', 'Read all of the documentation');

-- select tiltes that are not yet complete
select title
from tasks
where completed_at isnull;

-- update task of title "study sql"
update tasks
set completed_at = now()
where title = 'Study SQL';

-- select title AND description of tasks not yet completed
select title, description
from tasks
where completed_at isnull;

-- select all fields of every task sorted by creation date in descending order
select *
from tasks
order by created_at desc;

-- create a new task
insert into tasks (title, description)
values ('mistake 1', 'a test entry');

-- create a new task
insert into tasks (title, description)
values ('mistake 2', 'another test entry');

-- create a new task
insert into tasks (title, description)
values ('third mistake', 'another test entry');

-- select title fields of all tasks with a title that includes the word 'mistake'
select title
from tasks
where title like '%mistake%';

-- delete the task that has a title of "mistake 1"
delete from tasks
where title like 'mistake 1';

-- select title and description fields of all tasks with a title that includes the word 'mistake'
select title, description
from tasks
where title like '%mistake%';

-- delete all tasks that includes the word 'mistake' in the title
delete from tasks
where title like '%mistake%';

-- select all fields of all tasks sorted by title in ascending order
select *
from tasks
order by title asc;










