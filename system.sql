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
create sequence SQ_Przejazdy_czasowy start with 1 increment by 1;
create sequence SQ_Sedziowie start with 1 increment by 1;

---
--- Czyszczenie tabel
---

drop table TB_Zawodnicy;
drop table TB_Roboty;
drop table TB_Konkurencja;
drop table TB_Stanowiska;
drop table TB_Sesje;
drop table TB_Sparingi;
drop table TB_Przejazd_czasowy
drop table TB_Sedziowie;

---
--- Tworzenie tabel
---

create table TB_Zawodnicy (
    ID_Zawodnika number primary key,
    Imie varchar2 not null,
    Nazwisko varchar2 not null,
    Adres varchar2 not null,
    Uczelnia varchar2,
    Aktywny boolean
);

create table TB_Roboty (
    ID_Robota number primary key,
    ID_Zawodnika number foreign key,
    ID_Konkurencji number foreign key,
    Nazwa_robota varchar2 not null,
);

create table TB_Konkurencja (
    ID_Konkurencji number primary key,
    Nazwa varchar2 not null,
    Typ_oceny varchar2 not null,
    Godzina_startu date not null,
    Zakończona boolean
);

create table TB_Stanowiska (
    ID_Stanowiska number primary key,
    Stan boolean
);

create table TB_Sesje (
    ID_Sesji number primary key,
    ID_Konkurencji number foreign key,
    ID_Sedziego number foreign key,
    ID_Stanowiska number foreign key,
    Godzina_startu date not null
);

create table TB_Sparingi (
    ID_Sparingu number primary key,
    ID_Robota number foreign key,
    ID_Sesji number foreign key,
    Punkty number not null
);

create table TB_Przejazd_czasowy (
    ID_Przejazdu number primary key,
    ID_Robota number foreign key,
    ID_Sesji number foreign key,
    Czas number not null,
);

create table TB_Sedziowie (
    ID_Sedziego number primary key,
    Imie varchar2 not null,
    Nazwisko varchar2 not null,
);

