delimiter $$
create trigger ins_t
before insert on student_books
for each row
begin 
insert into book_fine(rno,bid,status)values(new.rno,new.bid,'I');
end $$
delimiter ;  

/*
mysql> select * from student_books;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-10 | 2023-02-10 |
|    2 |  202 | 2023-07-09 | 2023-08-09 |
|    3 |  103 | 2023-01-02 | 2023-01-09 |
+------+------+------------+------------+
3 rows in set (0.00 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
+------+------+--------+------+------+
3 rows in set (0.00 sec)

mysql> insert into student_books(rno,bid,doi) values(4,104,'2023-06-10');
Query OK, 1 row affected (0.07 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
|    4 |  104 | I      | NULL | NULL |
+------+------+--------+------+------+
4 rows in set (0.00 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
|    4 |  104 | I      | NULL | NULL |
+------+------+--------+------+------+
4 rows in set (0.00 sec)

*/                        
