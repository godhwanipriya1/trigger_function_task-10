---create a backup table

create table backup(id int,item_name varchar (100),price int,status boolean,
	item_type varchar(50),sgt varchar (25),total_sales int);

---delete function

create or replace function backup_items_data()
returns trigger as $$
	begin
	insert into backup values(old.id,old.item_name,old.price,old.status,old.item_type,old.sgt,old.total_sales);
    return old;
end;
$$ language plpgsql;

--trigger function

create trigger trigger_backup_items_data_after
after delete on items
for each row
execute function backup_items_data()

select * from items
select * from backup
delete from items where id = 10 
