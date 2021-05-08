---
--- To komentarz w sql 
---

---
--- Czyszczenie
---

drop sequence SQ_Zawodnicy;
drop sequence SQ_Roboty;
drop sequence SQ_Konkurencje;
drop sequence SQ_Stanowiska;
drop sequence SQ_Sesje;
drop sequence SQ_Sparingi;
drop sequence SQ_Przejazdy_czasowe;
drop sequence SQ_Sedziowie;

create sequence SQ_Zawodnicy start with 1 increment by 1;
create sequence SQ_Roboty start with 1 increment by 1;
create sequence SQ_Konkurencje start with 1 increment by 1;
create sequence SQ_Stanowiska start with 1 increment by 1;
create sequence SQ_Sesje start with 1 increment by 1;
create sequence SQ_Sparingi start with 1 increment by 1;
create sequence SQ_Przejazdy_czasowe start with 1 increment by 1;
create sequence SQ_Sedziowie start with 1 increment by 1;

---
--- Czyszczenie tabel
---

drop table TB_Sparingi;
drop table TB_Przejazd_czasowy;
drop table TB_Roboty;
drop table TB_Sesje;
drop table TB_Konkurencje;
drop table TB_Stanowiska;
drop table TB_Sedziowie;
drop table TB_Zawodnicy;
---
--- Tworzenie tabel
---

create table TB_Zawodnicy (
    ID_Zawodnika number primary key,
    Imie varchar2(32) not null,
    Nazwisko varchar2(32) not null,
    Mail varchar2(32) not null,
    Adres varchar2(32) not null,
    Uczelnia varchar2(32),
    Aktywny number(1) default 0 not null
);


create table TB_Sedziowie (
    ID_Sedziego number primary key,
    Imie varchar(32) not null,
    Nazwisko varchar(32) not null
);

create table TB_Konkurencje (
    ID_Konkurencji number primary key,
    Nazwa varchar2(32) not null,
    Typ_oceny varchar2(32) not null,
    Godzina_startu date not null,
    Zakonczona number(1) default 0 not null
);

create table TB_Roboty (
    ID_Robota number primary key,
    ID_Zawodnika number,
    ID_Konkurencji number,
    Nazwa_robota varchar2(32) not null,
    constraint FK_Zawodnik_Robot foreign key (ID_Zawodnika)
    references TB_Zawodnicy (ID_Zawodnika),
    constraint FK_Konkurencja_Robot foreign key (ID_Konkurencji)
    references TB_Konkurencje (ID_Konkurencji)
);

create table TB_Stanowiska (
    ID_Stanowiska number primary key,
    Stan number(1) default 0 not null
);

create table TB_Sesje (
    ID_Sesji number primary key,
    ID_Konkurencji number,
    ID_Sedziego number,
    ID_Stanowiska number,
    Godzina_startu date not null,
    constraint FK_Konkurencja_Sesja foreign key (ID_Konkurencji)
    references TB_Konkurencje (ID_Konkurencji),
    constraint FK_Sedzia_Sesja foreign key (ID_Sedziego)
    references TB_Sedziowie (ID_Sedziego),
    constraint FK_Stanowisko_Sesja foreign key (ID_Stanowiska)
    references TB_Stanowiska (ID_Stanowiska)
);

create table TB_Sparingi (
    ID_Sparingu number primary key,
    ID_Robota number,
    ID_Sesji number,
    Punkty number not null,
    constraint FK_Robot_Sparing foreign key (ID_Robota)
    references TB_Roboty (ID_Robota),
    constraint FK_Sesja_Sparing foreign key (ID_Sesji)
    references TB_Sesje (ID_Sesji)
);

create table TB_Przejazd_czasowy (
    ID_Przejazdu number primary key,
    ID_Robota number,
    ID_Sesji number,
    Czas number not null,
    constraint FK_Robot_Przejazd_Czasowy foreign key (ID_Robota)
    references TB_Roboty (ID_Robota),
    constraint FK_Sesja_Przejazd_Czasowy foreign key (ID_Sesji)
    references TB_Sesje (ID_Sesji)
);


---
--- Wypelnianie tabeli
---

insert into TB_Zawodnicy
values ( SQ_Zawodnicy.nextval ,'Gregory',  'Mzyku', 'patryk.szydlik@tlen.pl', 'Litomska Wroclaw', 'PWR', 0);

insert into TB_Sedziowie
values (SQ_Sedziowie.nextval,'Grzegorz','Mzyk');

insert into TB_Konkurencje
values (SQ_Konkurencje.nextval,'LineFollower', 'Czasowy', TIMESTAMP '2021-05-08 18:30:00', 0);

insert into TB_Roboty
values ( SQ_Roboty.nextval, SQ_Zawodnicy.currval, SQ_Konkurencje.currval, 'MegaZord' );

insert into TB_Stanowiska
values (SQ_Stanowiska.nextval, 0);

insert into TB_Sesje
values (SQ_Sesje.nextval, SQ_Konkurencje.currval, SQ_Sedziowie.currval, SQ_Stanowiska.currval, TIMESTAMP '2021-05-08 18:30:00');

insert into TB_Sparingi
values (SQ_Sparingi.nextval, SQ_Roboty.currval, SQ_Sesje.currval, 0 );
 
insert into TB_Przejazd_czasowy
values (SQ_Przejazdy_czasowe.nextval, SQ_Roboty.currval, SQ_Sesje.currval, 0);

