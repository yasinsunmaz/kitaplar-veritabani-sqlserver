/*
 * Created by Yasin Sunmaz on 01.01.2018
 */
/*
use master
GO
CREATE DATABASE Kitaplar
GO
*/
--First run the above code. Then run the code below by commenting on the line.
--Önce yukarýdaki kodu çalýþtýrýnýz. Sonrasýnda yorum satýrý haline getirerek alttaki kodlarý çalýþtýrýnýz.
USE Kitaplar
GO
CREATE TABLE KitapTurleri
(
	Id int primary key identity(1,1),
	KitapTuru nvarchar (20) not null default('Belirsiz')

)
GO
CREATE TABLE Yayinevleri
(
	Id int primary key identity (1,1),
	YayineviAdi nvarchar (30) not null default ('Belirsiz'),
	Adresi xml not null
)
GO
CREATE TABLE Yazarlar
(
	Id int primary key identity (1,1),
	Adi nvarchar (30) not null,
	Soyadi nvarchar (30) not null
)
GO
CREATE TABLE Kitaplar
(
	Id int primary key identity(1,1),
	IsbnNumarasi nvarchar (15) not null,
	Adi nvarchar (50) not null,
	KitapTurId int foreign key references  KitapTurleri(Id),
	SayfaSayisi smallint not null,
	Dili nvarchar (20) not null,
	SatisFiyati money not null,
	AlisFiyati money not null
)
GO
CREATE TABLE KitabiYayinlayanlar
(
	Id int primary key identity (1,1),
	KitapId int foreign key references Kitaplar(Id),
	YayineviId int foreign key references Yayinevleri (Id),
	YayinlanmaTarihi datetime not null
)
GO
CREATE TABLE KitabiYazanlar
(
	Id int primary key identity (1,1),
	KitapId int foreign key references Kitaplar (Id),
	YazarId int foreign key references Yazarlar (Id),
	BasimYili date not null default ('Belirsiz')
)
GO
CREATE TABLE Musteriler
(
	Id int primary key identity (1,1),
	Adi nvarchar (30) not null,
	Soyadi nvarchar (30) not null,
	Telefon char (11) not null,
	EPosta nvarchar (25) not null,
	Adres xml not null
)
GO
CREATE TABLE KitapSatislari
(
	Id int primary key identity (1,1),
	KitapId int foreign key references Kitaplar (Id),
	MusterilerId int foreign key references Musteriler (Id),
	Adet int not null,
	Tutar money not null,
	SatisTarihi datetime not null,
	TeslimTarihi datetime not null
)
GO