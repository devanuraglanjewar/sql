create table students2(
rollno int constraint p_k primary key,
stud_name varchar(100),
eng float,
science float,
maths float,
total float,
percentage float,
grade varchar(100)

)

insert into students2(rollno,stud_name,eng,science,maths) values (1,'Akshay',80,90,95),
                                                        (2,'Abhi',97,86,97),
                                                        (3,'Elon',76,97,78),
                                                        (4,'Donald',97,76,88)

insert into students2(rollno,stud_name,eng,science,maths) values (5,'Vasu',80,90,95)

select * from students2;



create or replace procedure sp_result()
language plpgsql
as $$
declare grade varchar(100);
begin 
    update students2
    set total = eng + science + maths ,
    percentage = (eng + science + maths)/3;
    
    update students2
    set 
    grade = case
    when (percentage >= 75) then
    'Distinction'
    when(percentage >= 60) then
    'First Class'
    when(percentage >= 50) then
    'Second Class'
    when(percentage >= 35) then
    'Third Class'
    else 'Fail'
    end;
    

raise notice 'Total marks , Percentage and Grades have been calculated and updated';

end;
$$;
call sp_result()