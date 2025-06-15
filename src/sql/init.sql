tee initlog.txt;

CREATE SCHEMA test;

USE test;


CREATE TABLE testTable(
    id int unsigned AUTO_INCREMENT PRIMARY KEY,
    testchars varchar(10) not null
);

INSERT INTO testTable(testchars) VALUES ('aourugh');

select * from testTable;

notee;
