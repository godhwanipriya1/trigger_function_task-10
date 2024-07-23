select * from emp_data
	
alter table emp_data add column previous_salary int;

--trigger function with update query

create or replace function salary_updated()
returns trigger as $$
begin
	 new.previous_salary  = old.salary;     
return new;
end
$$ language plpgsql;

---trigger function

create trigger trigger_salary_updated
before update on emp_data
for each row
execute function salary_updated()

---update query
update emp_data set salary = 35000 where id = 1
UPDATE emp_data set salary = salary * 1.10;


