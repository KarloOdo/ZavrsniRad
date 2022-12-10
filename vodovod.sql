# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Karlo\OneDrive\Dokumenti\javatecaj\vodovod.sql

drop database if exists vodovod;
create database vodovod;
use vodovod;
create table korisnik(
    sifra int not null primary key auto_increment,
    naziv varchar(250),
    adresa varchar(200),
    oib varchar(11)
);

create table racun(
    sifra int not null primary key auto_increment,
    broj_racuna varchar(50),
    datum datetime,
    poziv_na_broj varchar(80),
    status varchar(50),
    napomena varchar(500)
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(250),
    jedinica_mjere varchar(50),
    cijena decimal(17,2)
);

create table stavke_racuna(
    oznaka int not null primary key auto_increment,
    redni_broj int,
    kolicina decimal(17,2),
    cijena decimal(17,2)
);

alter table korisnik add foreign key (sifra) references racun(sifra);
alter table racun add foreign key (sifra) references stavke_racuna(oznaka);
alter table usluga add foreign key (sifra) references stavke_racuna(oznaka);