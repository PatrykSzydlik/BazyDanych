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
  insert into TB_Przejazd_czasowy
  values (SQ_Przejazdy_czasowe.nextval, id_robota_p, id_sesji_p, czas_przejazdu_p);
  commit;
end;
/

create or replace procedure usun_przejazd(
    id_przejazdu_p number
)
as
begin
    delete from TB_Przejazd_czasowy
    where ID_Przejazdu = id_przejazdu_p;
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
        dbms_output.put_line( 'Przejazd '||id_przejazdu_p ||' Sesja '||
                            id_sesji_p ||' Robot '||
                            id_robota_p ||' Czas '||
                            czas_p  ||' ' );
    end loop;
end;
/
