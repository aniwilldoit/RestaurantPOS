LOAD DATA
INFILE 'D:\items.txt'
INTO TABLE items 
FIELDS TERMINATED BY ","
(
item_id,
item_name,
item_price,
item_type "TRIM(:item_type)"
)