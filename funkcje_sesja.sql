---
--- Sesja
---

create or replace procedure dodaj_sesje(
    id_konkurencji_p number,
    id_stanowiska_p number,
    id_sedziego_p number,
    czas_startu_p varchar2
)
as 
begin
  insert into TB_Sesje
  values (SQ_Sesje.nextval, id_konkurencji_p, id_stanowiska_p, id_sedziego_p, TO_DATE(czas_startu_p));
  commit;
  exception
  when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Takia sesja');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure usun_sesje(
    id_sesji_p number
)
as
begin
    delete from TB_Sesje
    where ID_Sesji = id_sesji_p;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego przejazdu');
end;
/

create or replace procedure wyswietl_sesje_konkurencji(
    id_konkurencji_p number
)
as
begin
    FOR rec in (select ID_Sesji, ID_Stanowiska, ID_Sedziego, Godzina_startu
                from TB_Sesje
                where ID_Konkurencji = id_konkurencji_p)
    loop
        dbms_output.put_line( 'Sesja '||rec.ID_Sesji ||' Stanowisko '||
                        rec.ID_Stanowiska ||' Konkurencja '||
                        id_konkurencji_p ||' Sedzia '||
                        rec.ID_Sedziego ||' Czas startu '|| 
                        rec.Godzina_startu);
    end loop;
end;
/

create or replace procedure wyswietl_sesje_stanowiska(
    id_stanowiska_p number
)
as
begin
    FOR rec in (select ID_Sesji, ID_Konkurencji, ID_Sedziego, Godzina_startu
                from TB_Sesje
                where ID_Stanowiska = id_stanowiska_p)
    loop
        dbms_output.put_line( 'Sesja '||rec.ID_Sesji ||' Stanowisko '||
                        id_stanowiska_p ||' Konkurencja '||
                        rec.ID_Konkurencji ||' Sedzia '||
                        rec.ID_Sedziego ||' Czas startu '|| 
                        rec.Godzina_startu);
    end loop;
end;
/
