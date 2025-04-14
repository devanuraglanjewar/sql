SELECT * FROM BOOK;
TRUNCATE TABLE BOOK;
CREATE TABLE Book(
 BookId int  GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) ,
 Title varchar(50) ,
 Author varchar(50) ,
 Price decimal(4, 2) )

do
$$
declare 
    i int :=1;
begin
while (i<100000) loop
INSERT INTO BOOK(TITLE,AUTHOR,PRICE) VALUES(concat('Title',i),concat('Author',i),10.56);
i:=i +1;
end loop;
end;$$

create index index_p ON BOOK (BookId);
SELECT * FROM BOOK 
    WHERE bookId > 200857 and bookId < 201447;

-- multiple column index
create index index_p2 ON BOOK (BookId,title);
DROP INDEX index_p2;
EXPLAIN ANALYZE SELECT * FROM BOOK 
    WHERE bookId = 200857 AND title = 'Title409';

S
	