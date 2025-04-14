-- print 1 to 10
CREATE OR REPLACE PROCEDURE print_num()
language plpgsql
as $$
BEGIN 
	FOR cnt IN 1..10 LOOP
        RAISE NOTICE '%', cnt;
    END LOOP;
End; $$;

call print_num();