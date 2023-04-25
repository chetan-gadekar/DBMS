/* here we update the rating */  
Delimiter //
create procedure up_rating1(in s int)
begin
update sailors set srating=srating+1 where sid=s;
end //
delimiter ; 

/*
mysql> select * from silors;
ERROR 1146 (42S02): Table 'HRS.silors' doesn't exist
mysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | chetan |      13 |
|    2 | abhi   |      19 |
+------+--------+---------+
2 rows in set (0.00 sec)

mysql> source /home/student/boat.sql
ERROR 1304 (42000): PROCEDURE up_rating already exists
mysql> source /home/student/boat.sql
Query OK, 0 rows affected (0.14 sec)

mysql> call up_rating1(1);
Query OK, 1 row affected (0.19 sec)

mysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | chetan |      14 |
|    2 | abhi   |      19 |
+------+--------+---------+
2 rows in set (0.00 sec)

*/
