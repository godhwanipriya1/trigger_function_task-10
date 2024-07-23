select * from student_data

---Trigger Function use with Insert Function
	
create or replace function student_details()
returns trigger as $$
begin
	if new.marks< 80 then
	new.marks = new.marks + 5;
	end if;
return new;
end
$$ language plpgsql;

--Trigger Function

create trigger trigger_student_details
before insert on student_data
for each row 
execute function student_details()

	
insert into student_data (roll_no,name,gender,city,marks,grade,status) values(121,'manju','f','benglore',30,'C','false')

