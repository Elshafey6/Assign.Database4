--Part1
create database test3

create table Employees (
    Id int identity primary key,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    Salary decimal(10,2)
);

insert into Employees (FirstName, LastName, Salary)
values
('Ali', 'Mahmoud', 5500),
('Youssef', 'Ahmed', 6200),
('Khaled', 'Samir', 4800),
('Nour', 'Hassan', 7100),
('Hany', 'Adel', 5300),
('Salma', 'Mostafa', 6700),
('Tamer', 'Ibrahim', 5900),
('Laila', 'Fathy', 7500),
('Karim', 'Nabil', 4600),
('Dina', 'Wael', 6800);

select * from Employees;

create procedure GetAllEmployees
as
begin
    select * from Employees;
end;

exec GetAllEmployees;

create procedure GetHighSalaryEmployees
    @MinSalary decimal(10,2)
as
begin
    select *
    from Employees
    where Salary > @MinSalary;
end;

exec GetHighSalaryEmployees 5000;

create procedure AddEmployee
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @Salary decimal(10,2)
as
begin
    insert into Employees (FirstName, LastName, Salary)
    values (@FirstName, @LastName, @Salary);
end;

exec AddEmployee 'Ahmed', 'Ali', 6000;

--Part2
create table EmployeeLog (
    Id int identity primary key,
    EmployeeId int,
    [Action] nvarchar(100),
    ActionDate decimal default GETDATE()
);

create trigger AfterInsertEmployee
on Employees
after insert
as
begin
    insert into EmployeeLog (EmployeeId, [Action])
    SELECT Id, 'Employee Added'
    FROM inserted;
END;

EXEC AddEmployee 'Mohamed', 'Hassan', 7000;

SELECT * FROM EmployeeLog;