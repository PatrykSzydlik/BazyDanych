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
    i := 0;
    select ID_Sesji
    into id_sesji_p
    from TB_Sesje
    where ID_Konkurencji = id_konkurencji_p;
    for rec in (select ID_Robota, Czas
                from TB_Przejazd_czasowy
                where ID_sesji = id_sesji_p order by Czas)
    loop
        select Nazwa_robota into nazwa_r from TB_Roboty where ID_Robota = rec.ID_Robota;
        dbms_output.put_line(rec.ID_Robota ||' ' ||
                             nazwa_r || ' ' || 
                             rec.Czas ||' ');
        i := i + 1;
        exit when i = ilosc_robotw;
    end loop;
    
end;
/

create or replace function  login_zawodnika(
 p_username IN VARCHAR2,
 p_password IN VARCHAR2
)
 RETURN BOOLEAN
AS
 pwd VARCHAR2 (32);
 id number;
BEGIN
    id := znajdz_zawodnika(p_username);
 SELECT HASLO
 into  pwd 
 FROM TB_Hasla
 WHERE ID_Zawodnika = id AND HASLO = p_password;
RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END  login_zawodnika;
/
create or replace function  login_sedziego(
 p_username IN VARCHAR2,
 p_password IN VARCHAR2
)
 RETURN BOOLEAN
AS
 pwd VARCHAR2 (32);
 id number;
BEGIN
    id := TO_NUMBER(p_username);
 SELECT HASLO
 into  pwd 
 FROM TB_Hasla
 WHERE ID_Sedziego = id AND HASLO = p_password;
RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END login_sedziego;
/