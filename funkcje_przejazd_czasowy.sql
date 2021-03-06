---
--- Przejazd czasowy
---

create or replace procedure dodaj_przejazd(
    id_robota_p number,
    id_sesji_p number,
    czas_przejazdu_p number
)
as 
begin
  if czas_przejazdu_p is null then
    raise_application_error(-20000, 'Nie mozna dodac pustego rekordu');
  end if;
  insert into TB_Przejazd_czasowy
  values (SQ_Przejazdy_czasowe.nextval, id_robota_p, id_sesji_p, czas_przejazdu_p);
  commit;
  exception
  when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Taki przejazd juz istnieje');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure usun_przejazd(
    id_przejazdu_p number
)
as
begin
    delete from TB_Przejazd_czasowy
    where ID_Przejazdu = id_przejazdu_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego przejazdu');
end;
/

create or replace procedure wyswietl_przejazdy_sesji(
    id_sesji_p number
)
as
    id_robota_p number;
    id_przejazdu_p number;
    czas_p number;
begin
    FOR rec in (select ID_Przejazdu, ID_Robota, Czas
                into id_przejazdu_p, id_robota_p, czas_p
                from TB_Przejazd_czasowy
                where ID_Sesji = id_sesji_p)
    loop
        dbms_output.put_line( 'Sparing '|| rec.ID_Przejazdu ||' Sesja '||
                        id_sesji_p || ' Robot ' ||
                        rec.ID_Robota ||' Punkty '||
                        rec.Czas  ||' ' );
    end loop;
end;
/
