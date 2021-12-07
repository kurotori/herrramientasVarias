use information_schema;
drop procedure if exists limpiar_servidor;

delimiter //
create procedure limpiar_servidor()
begin
    declare bdd varchar(64);   
    set @basesLocales="information_schema,mysql,performance_schema,sys";
    DECLARE cur1 CURSOR FOR SELECT SCHEMA_NAME FROM SCHEMATA;
    
    OPEN cur1;

    LOOP
        FETCH cur1 into bdd;
        if bdd not in(@basesLocales)
            drop database bdd;
        end if;
    END LOOP;
    
    close cur1;
end//
delimiter ;

call limpiar_servidor();
drop procedure limpiar_servidor;


