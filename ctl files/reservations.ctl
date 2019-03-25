LOAD DATA
INFILE 'D:\reservations.txt'
INTO TABLE reservations
FIELDS TERMINATED BY ","
(
rev_id,
rev_date,
no_of_person,
res_id,
cust_id "TRIM(:cust_id)"
)