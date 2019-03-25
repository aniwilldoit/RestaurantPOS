LOAD DATA
INFILE 'D:\orders.txt'
INTO TABLE orders TRUNCATE
FIELDS TERMINATED BY ","
(
order_id,
order_date,
order_qty,
bill_amount,
order_type,
item_id,
res_id,
cust_id,
mgr_id "TRIM(:mgr_id)"
)