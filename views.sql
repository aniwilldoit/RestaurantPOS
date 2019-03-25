CREATE or replace view my_colleague
as
	select employee_id, employee_name, employee_user, employee_phone, manager_id, department_id, restaurant_id from backupmycolleague
	     WHERE manager_id <> 10001          
	WITH READ ONLY CONSTRAINT emp_det
;

CREATE or replace view my_managers
as
	select employee_id, employee_name, employee_user, employee_phone, department_id from backupmycolleague
	     WHERE manager_id = 10001          
	WITH READ ONLY CONSTRAINT mgr_det
;

