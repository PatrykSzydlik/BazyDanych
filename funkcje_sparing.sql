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

create or replace procedure wyswietl_sparingi_sesji(
    id_sesji_p number
)
as
    id_sparingu_p number;
    id_robota_p number;
    punkty_p number;
begin
    FOR rec in (select ID_Sparingu, ID_Robota, Punkty
                into id_sparingu_p, id_robota_p, punkty_p
                from TB_Sparingi
                where ID_Sesji = id_sesji_p)
    loop
        dbms_output.put_line( ' Sparing '||id_sparingu_p ||' Sesja '||
                        id_sesji_p ||' Robot '||
                        id_robota_p ||' Punkty '||
                        punkty_p  ||' ' );
    end loop;
end;
/
