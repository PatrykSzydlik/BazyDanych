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
  insert into TB_Przejazd_czasowy
  values (SQ_Przejazdy_czasowe.nextval, id_robota_p, id_sesji_p, czas_przejazdu_p);
  commit;
end;
/

create or replace procedure usun_sparing(
    id_sparingu_p number
)
as
begin
    delete from TB_Sparingi
    where ID_Sparingu = id_sparingu_p;
end;
/

create or replace procedure wyswietl_przejazd_sesji(
    id_sesji_p number
)
as
    id_przejazdu_p number;
    id_robota_p number;
    czas_przejazdu_p number;
begin
    select ID_Przejazdu, ID_Robota, Czas
    into id_przejazdu_p, id_robota_p, czas_przejazdu_p
    from TB_Przejazd_czasowy
    where ID_Sesji = id_sesji_p;
    dbms_output.put_line( ' Przejazd '||id_przejazdu_p ||' Sesja '||
                        id_sesji_p ||' Robot '||
                        id_robota_p ||' Czas '||
                        czas_przejazdu_p  ||' ' );
end;
/
