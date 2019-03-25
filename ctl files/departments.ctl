LOAD DATA
INFILE 'D:\departments.txt'
INTO TABLE departments TRUNCATE
FIELDS TERMINATED BY ","
(
dept_id,
dept_name "TRIM(:dept_name)"
)