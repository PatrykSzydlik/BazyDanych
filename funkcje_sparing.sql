---
--- Sparing
---

create or replace procedure dodaj_sparing(
    id_robota_p number,
    id_sesji_p number,
    punkty_p number
)
as 
begin
  insert into TB_Sparingi
  values (SQ_Sparingi.nextval, id_robota_p, id_sesji_p, punkty_p);
  commit;
  exception
  when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Taki sparing juz istnieje');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure aktualizuj_punkty_sparing(
    id_sparingu_p number,
    punkty_p number
)
as
begin
    update TB_Sparingi set Punkty = Punkty + punkty_p where ID_Sparingu = id_sparingu_p; 
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego spraringu');
end;
/

create or replace procedure usun_sparing(
    id_sparingu_p number
)
as
begin
    delete from TB_Sparingi
    where ID_Sparingu = id_sparingu_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego spraringu');
end;
/

create or replace procedure wyswietl_sparingi_sesji(
    id_sesji_p number
)
as
begin
    FOR rec in (select ID_Sparingu, ID_Robota, Punkty
                from TB_Sparingi
                where ID_Sesji = id_sesji_p)
    loop
        dbms_output.put_line( 'Sparing '|| rec.ID_Sparingu ||' Sesja '||
                        id_sesji_p || ' Robot ' ||
                        rec.ID_Robota ||' Punkty '||
                        rec.Punkty  ||' ' );
    end loop;
end;
/
