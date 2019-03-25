LOAD DATA

INFILE 'D:\restaurants.txt'
INTO TABLE restaurants 
FIELDS TERMINATED BY ","
(
res_id,
res_name,
res_add,
res_phone,
res_mail
)