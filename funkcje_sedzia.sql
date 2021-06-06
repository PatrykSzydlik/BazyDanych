---
--- Sedzia 
---

create or replace procedure dodaj_sedziego(
    Imie_sedziego varchar2,
    Nazwisko_sedziego varchar2,
    Haslo varchar2
)
as 
begin
  insert into TB_Sedziowie
  values (SQ_Sedziowie.nextval, Imie_sedziego, Nazwisko_sedziego);
  dodaj_haslo(null,SQ_Sedziowie.currval,Haslo);
  commit;
  exception
    when dup_val_on_index then
        rollback;
        raise_application_error(-20000, 'Taki robot już sedziego');
    when OTHERS then
        rollback;
        raise_application_error(-20000, 'Wystapil problem');
end;
/

create or replace procedure usun_sedziego(
    id_sedziego_p number
)
as
begin
    delete from TB_Sedziowie
    where ID_Sedziego = id_sedziego_p;
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego sedziego');
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
    commit;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego sedziego');
end;
/

create or replace function  wyswietl_sedziego(
    Imie_sedziego varchar2,
    Nazwisko_sedziego varchar2
)return number
as
    id number;
begin
    select ID_Sedziego
    into id
    from TB_Sedziowie
    where Imie = Imie_sedziego and Nazwisko =  Nazwisko_sedziego;
    dbms_output.put_line ( id ||' '||
                        Imie_sedziego ||' '||
                        Nazwisko_sedziego
                        );
    return id;
    exception
    when NO_DATA_FOUND then
        rollback;
        raise_application_error(-20000, 'Nie ma takiego sedziego');
end;
/