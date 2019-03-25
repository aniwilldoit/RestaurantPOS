DROP TABLE restaurants cascade constraints;
DROP TABLE employees cascade constraints;
DROP TABLE departments cascade constraints;
DROP TABLE customer cascade constraints;
DROP TABLE items cascade constraints;
DROP TABLE reservations cascade constraints;
DROP TABLE orders cascade constraints;
DROP TABLE accesslog cascade constraints;
DROP TABLE emplog cascade constraints;
DROP TABLE backupmycolleague cascade constraints;


 CREATE TABLE restaurants
     ( res_id    NUMBER(4) PRIMARY KEY,
       res_name     VARCHAR2(30)
             CONSTRAINT     res_name_nn  NOT NULL,
       res_add          varchar2(20),
       res_phone        number(11)
     CONSTRAINT     res_phone_nn  NOT NULL,
       res_mail         varchar2(30)
     CONSTRAINT     res_mail_nn  NOT NULL
     );


CREATE TABLE employees
    ( emp_id     NUMBER(6) PRIMARY KEY,
      emp_name   VARCHAR2(30)
            CONSTRAINT     emp_nm_nn  NOT NULL,
      emp_user   VARCHAR2(30)
            CONSTRAINT     emp_usr_nn  NOT NULL,
      emp_pass   VARCHAR2(20)
            CONSTRAINT     emp_pss_nn  NOT NULL,
      emp_phone  NUMBER(11)
   CONSTRAINT     emp_phne_nn  NOT NULL,
      emp_sal    NUMBER(8,2)

     CONSTRAINT     emp_sl_min
                     CHECK (emp_sal > 0),
      emp_doj    DATE
   	CONSTRAINT     emp_doj_nn  NOT NULL,
      mgr_id     NUMBER(6),
      dept_id    NUMBER(4),
      res_id     NUMBER(4),
      FOREIGN KEY (res_id) REFERENCES restaurants(res_id)

    );




CREATE TABLE departments
    ( dept_id     NUMBER(6) PRIMARY KEY,
      dept_name   VARCHAR2(20)
            CONSTRAINT     dept_name_nn  NOT NULL
    );


CREATE TABLE customer(
      cust_id 	NUMBER(6)  PRIMARY KEY,
      cust_name      VARCHAR2(30)  
	CONSTRAINT 		cust_name_nn  NOT NULL,
      cust_user   VARCHAR2(30)
            CONSTRAINT     cust_user_nn  NOT NULL,
      cust_pass   VARCHAR2(20)
            CONSTRAINT     cust_pass_nn  NOT NULL,
      cust_phone 	NUMBER(12)
            CONSTRAINT     cust_phone_nn  NOT NULL,
      cust_address	VARCHAR2(20)

);


CREATE TABLE items
	(item_id NUMBER(6) PRIMARY KEY,
	 item_name VARCHAR2(30)
	    	CONSTRAINT item_name_nn NOT NULL,
         item_price NUMBER(6)    
        	CONSTRAINT item_price_nn NOT NULL,
	 item_type VARCHAR2(20)
	);



CREATE TABLE reservations
	(rev_id NUMBER(6) PRIMARY KEY,
	 rev_date   	  DATE
	   CONSTRAINT rev_date_nn NOT NULL,
	 no_of_person  NUMBER(6)
	   CONSTRAINT no_of_person_nn NOT NULL,
	 res_id     NUMBER(4),
	 cust_id    NUMBER(6),
		FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	 	FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);







CREATE TABLE orders(
	order_id NUMBER(6) PRIMARY KEY,
	order_date  DATE
                CONSTRAINT order_date_nn  NOT NULL,
	order_qty  NUMBER(6)
		CONSTRAINT order_qty_nn  NOT NULL,
	bill_amount  NUMBER(6)
		CONSTRAINT bill_amt_nn  NOT NULL,
	order_type   VARCHAR2(20)
           CONSTRAINT order_type_nn  NOT NULL,
	item_id      NUMBER(4)
		CONSTRAINT item_id1_nn  NOT NULL,
	res_id	     NUMBER(4)
		CONSTRAINT res_id1_nn  NOT NULL,
	cust_id      NUMBER(5)
		CONSTRAINT cust_id1_nn  NOT NULL,
	mgr_id       NUMBER(5)
		CONSTRAINT mgr_id  NOT NULL,
	FOREIGN KEY (item_id) REFERENCES items(item_id),
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
	FOREIGN KEY (mgr_id) REFERENCES employees(emp_id)
);

CREATE TABLE accesslog(
	user_id varchar2(30),
	user_pass varchar2(30),
	action varchar2(30),
	time timestamp(0)
);

CREATE Table backupmycolleague
(
	employee_id 	number(6),
	employee_name 	varchar2(30),
	employee_user 	varchar2(30),
	employee_phone 	number(12),
	employee_salary	number(8),
	manager_id 	number(8),
	department_id 	number(5),
	restaurant_id 	number(5)	
);

create table emplog
(
	emp_id number(10),
	emp_name varchar2(30),
	emp_user varchar2(30),
	emp_phone number(12),
	time timestamp(0)
);

