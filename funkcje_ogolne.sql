---
--- Funkcje użytku ogólnego
---

create or replace procedure wyswietl_ranking_punktowy(
    id_konkurencji_p number,
    ilosc_robotw number
)
as
    id_sesji_p number;
    i number;
    nazwa_r varchar2(40);
begin
    i := 0;
    select ID_Sesji
    into id_sesji_p
    from TB_Sesje
    where ID_Konkurencji = id_konkurencji_p;
    for rec in (select ID_Robota, Punkty
                from TB_Sparingi
                where ID_sesji = id_sesji_p order by Punkty desc)
    loop
        
        select Nazwa_robota into nazwa_r from TB_Roboty where ID_Robota = rec.ID_Robota;
        dbms_output.put_line(rec.ID_Robota ||' ' ||
                             nazwa_r || ' ' ||   
                             rec.Punkty ||' ');
        i := i + 1;
        exit when i = ilosc_robotw;
    end loop;
    
end;
/

create or replace procedure wyswietl_ranking_czasowy(
    id_konkurencji_p number,
    ilosc_robotw number
)
as
    id_sesji_p number;
    i number;
    nazwa_r varchar2(40);
begin
    i := 1;
    select ID_Sesji
    into id_sesji_p
    from TB_Sesje
    where ID_Konkurencji = id_konkurencji_p;
    for rec in (select ID_Robota, Czas
                from TB_Przejazd_czasowy
                where ID_sesji = id_sesji_p order by Czas)
    loop
        exit when i = ilosc_robotw;
        select Nazwa_robota into nazwa_r from TB_Roboty where ID_Robota = rec.ID_Robota;
        dbms_output.put_line(rec.ID_Robota ||' ' ||
                             nazwa_r || ' ' || 
                             rec.Czas ||' ');
        i := i + 1;
        exit when i = ilosc_robotw;
    end loop;
    
end;
/