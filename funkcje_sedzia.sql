---
--- Sedzia 
---

create or replace procedure dodaj_sedziego(
    Imie_sedziego varchar2,
    Nazwisko_sedziego varchar2
)
as 
begin
  insert into TB_Sedziowie
  values (SQ_Sedziowie.nextval, Imie_sedziego, Nazwisko_sedziego);
  commit;
end;
/

create or replace procedure usun_sedziego(
    id_sedziego_p number
)
as
begin
    delete from TB_Sedziowie
    where ID_Sedziego = id_sedziego_p;
end;
/

create or replace procedure usun_sedziego_po_imieniu(
    Imie_sedziego varchar2,
    Nazwisko_sedziego varchar2
)
as
begin
    delete from TB_Sedziowie
    where Imie = Imie_sedziego and Nazwisko = Nazwisko_sedziego;
end;
/i