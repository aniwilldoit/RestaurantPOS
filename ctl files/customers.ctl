LOAD DATA
INFILE 'D:\customers.txt'
INTO TABLE customer 
FIELDS TERMINATED BY ","
(
cust_id,
cust_name,
cust_user,
cust_pass,
cust_phone,
cust_address "TRIM(:cust_address)"
)