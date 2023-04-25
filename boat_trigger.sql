delimiter //
create trigger rateing
before insert on reserve
for each row
begin
call up_rating(new.sid);
end //
delimiter ;


/*

mysql> select * from reserve;
+------+------+------------+
| bid  | sid  | dor        |
+------+------+------------+
|  101 |    1 | 2023-10-12 |
|  102 |    2 | 2024-10-11 |
|  101 |    1 | 2023-12-10 |
|  101 |    1 | 2023-03-04 |
|  101 |    1 | 2023-04-04 |
|  101 |    1 | 2023-03-04 |
+------+------+------------+
6 rows in set (0.00 sec)

mysql> select * from boats;
+------+-------+--------+
| bid  | bname | bcolor |
+------+-------+--------+
|  101 | b1    | red    |
|  102 | b2    | black  |
+------+-------+--------+
2 rows in set (0.02 sec)

mysql> insert into reserve values(1,101,'2024-10-12');
Query OK, 1 row affected (0.08 sec)

mysql> select * from reserve;
+------+------+------------+
| bid  | sid  | dor        |
+------+------+------------+
|  101 |    1 | 2023-10-12 |
|  102 |    2 | 2024-10-11 |
|  101 |    1 | 2023-12-10 |
|  101 |    1 | 2023-03-04 |
|  101 |    1 | 2023-04-04 |
|  101 |    1 | 2023-03-04 |
|    1 |  101 | 2024-10-12 |
+------+------+------------+
7 rows in set (0.00 sec)

*/
