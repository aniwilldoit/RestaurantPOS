LOAD DATA
INFILE 'D:\employees.txt'
INTO TABLE employees
FIELDS TERMINATED BY ","
(
emp_id,
emp_name,
emp_user,
emp_pass,
emp_phone,
emp_sal,
emp_doj,
mgr_id,
dept_id,
res_id "TRIM(:res_id)"
)