/* cursor program ti increment rating  of boat sailors*/

delimiter //
create procedure proc_increment1()
begin
	declare vfinished int default 0;
	declare si int;
	declare n varchar(25);
	declare sr int(2);
	
declare emp_cursor cursor for select * from sailors;
declare continue handler for not found set vfinished=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into si,n,sr;
     if vfinished=1 then
     leave getdata;
     end if;
    update sailors set srating=srating+2 ;
    end loop getdata;
    close emp_cursor;
    end //
delimiter ;

/*
ysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | chetan |      14 |
|    2 | abhi   |      19 |
+------+--------+---------+
2 rows in set (0.00 sec)

mysql> call porc_increment1();
ERROR 1305 (42000): PROCEDURE HRS.porc_increment1 does not exist
mysql> call proc_increment1();
Query OK, 0 rows affected (0.14 sec)

mysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | chetan |      16 |
|    2 | abhi   |      21 |
+------+--------+---------+
2 rows in set (0.00 sec)

*/
