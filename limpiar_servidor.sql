use mysql;
drop procedure if exists limpiar_servidor;

delimiter #
create procedure limpiar_servidor()
begin
    declare cur1 CURSOR FOR show databases;
    declare bdd varchar(30);   
    set @basesLocales='information_schema,mysql,performance_schema,sys';
    
    OPEN cur1;

    bucle: LOOP
        FETCH cur1 into bdd;
        if bdd not in(@basesLocales)
            drop database bdd;
        end if;
    end loop;
    
    close cur1;
end#
delimiter ;

call limpiar_servidor();
drop procedure limpiar_servidor;


