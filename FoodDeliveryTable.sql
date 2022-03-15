--create database FoodDeliveryDB;

use FoodDeliveryDB;

create table Clients(
Client_ID int identity NOT NULL,
Name varchar(20) NOT NULL,
AddressClient varchar(40) NOT NULL,
PhoneNumber nvarchar(10) NOT NULL,
constraint PK_Clients Primary key(Client_ID)
);

create table Food(
FoodName_ID varchar(20) NOT NULL,
TypeOfFood varchar(20) NOT NULL,
Price numeric(6,3) NOT NULL,
constraint PK_Food Primary key(FoodName_ID)
);

create table OrderDate(
Order_ID Int Identity NOT NULL,
Client_ID int NOT NULL,
DateOrder datetime NOT NULL,
DateDelivery datetime NOT NULL,
Quantity int NOT NULL,
FoodName_ID varchar(20) NOT NULL,
constraint PK_OrderDate Primary key(Order_ID),
constraint FK_OrderDate_Food foreign key(FoodName_ID)
references Food(FoodName_ID),
constraint FK_OrderDate_Clients foreign key(Client_ID)
references Clients(Client_ID)
);

create table Providers(
Provider_ID int identity NOT NULL,
Status varchar(20) NOT NULL,
TimeDelivery time NOT NULL,
Client_ID int NOT NULL,
Mark float(10) NOT NULL,
MethodOfPayment varchar(20) NOT NULL,
Order_ID int NOT NULL,
constraint PK_Providers Primary key(Provider_ID),
constraint FK_Providers_Clinets foreign key(Client_ID)
references Clients(Client_ID),
constraint FK_Providers_OrderDate foreign key(Order_ID)
references OrderDate(Order_ID)
);

create table Workers(
Worker_ID int identity NOT NULL,
WorkerName varchar(20) NOT NULL,
WorkerShift varchar(20) NOT NULL,
Provider_ID int NOT NULL,
constraint PK_Workers Primary key(Worker_ID),
constraint FK_Workers_Providers foreign key(Provider_ID)
references Providers(Provider_ID)
);