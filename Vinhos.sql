--drop database VinhosDatabase;
--create database VinhosDatabase;
--go
use VinhosDatabase;
--use Northwind;
go
create schema Vinhos;
--drop schema Vinhos;
go
create type validint from int not null;
go
create type validname from varchar(30) not null;
go


create table Vinhos.Users(
    Nome                    validname,   
    DataNascimento          date,
    Pass                    validname,
    Salt                    validname,
    NIF                     varchar(8) not null,
	primary key(NIF),
);
--drop table Vinhos.Owner;
create table Vinhos.Owner(
    Nome                    validname,   
    Telefone                varchar(9),
    Grupo                   validname,
    NIF                     varchar(8),
	primary key(Telefone),
    foreign key (NIF) references Vinhos.Users(NIF) on delete cascade,
);

create table Vinhos.Vinho(
    Nome                    validname,  
    PercentagemAlcool       validint,
    Preco                   validint,
    DataEngarrafamento      date,
    Capacidade              int,
    teorAlcool              int,
    TemperaturaServir       varchar(7),
    Avaliacao               validint,
    Descricao               VARCHAR(300),
    InfoNutricional         VARCHAR(60),
    ID                      validint,
    primary key(ID),
);

create table Vinhos.Derivados(
    Nome                    validname,  
    Descricao               VARCHAR(60),
    ID                      validint,
    primary key(ID),
);


create table Vinhos.Quinta(
    Nome                    validname,   
    Telefone                varchar(9) not null,
    TamanhoProducao         int,
    Descricao               VARCHAR(60),
    DerivadoId              int ,
    primary key(Telefone),
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
    foreign key (DerivadoId) references Vinhos.Derivados(ID)  on delete cascade,
);



create table Vinhos.OwnerShip(  
    TelefoneOwner           varchar(9),
    TelefoneQuinta          varchar(9),
    foreign key (TelefoneQuinta) references Vinhos.Quinta(Telefone) ,
    foreign key (TelefoneOwner) references Vinhos.Owner(Telefone)  on delete cascade, 
);


create table Vinhos.Castas(  
    Descricao               VARCHAR(60),
    Nome                    validname,
    Aroma                   validname,
    ID                      validint,
    primary key(ID),
);

create table Vinhos.Tem(  
    VinhoId           validint,
    CastasID          validint,
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
    foreign key (CastasID) references Vinhos.Castas(ID)  on delete cascade, 
);

create table Vinhos.Regiao(  
    Solo              validname,
    Clima             validname,
    Nome              validname,
    Codigo            validint,
    Id                validint,
    QuintaID          varchar(9) not null,
    primary key(Id),
    foreign key (QuintaID) references Vinhos.Quinta(Telefone)  on delete cascade, 
);

create table Vinhos.Concursos(  
    Premiacoes        varchar(20),
    CodigoConcurso    validint,
    primary key (CodigoConcurso),
);

create table Vinhos.Participa(  
    VinhoId           validint,
    CodigoConcurso    validint,
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
    foreign key (CodigoConcurso) references Vinhos.Concursos(CodigoConcurso)  on delete cascade, 
);

create table Vinhos.Enologos(  
    Nome                    validname,
    Nparticipacoes          int,
    NSocioEnologo           validint,
    VinhoId                 validint,
    UserId                  varchar(8),
    primary key (NSocioEnologo),
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
    foreign key (UserId) references  Vinhos.Users(NIF)  on delete cascade, 
);

create table Vinhos.SaoJuri(  
    ConcursoID           validint,
    SocioEnologo         validint,
    foreign key (SocioEnologo) references Vinhos.Enologos(NSocioEnologo)  on delete cascade,
    foreign key (ConcursoID) references Vinhos.Concursos(CodigoConcurso)  on delete cascade, 
);

create table Vinhos.Distribuidor(
    Nome                    validname,
    Adress                  int,
    ID                      validint,
    UserID                  varchar(8),
    primary key (ID),
    foreign key (UserId) references  Vinhos.Users(NIF)  on delete cascade,
);

create table Vinhos.Distribui(  
    QuintaID           varchar(9) not null,
    DistribuiID        validint,
    foreign key (DistribuiID) references Vinhos.Distribuidor(ID) on delete cascade,
    foreign key (QuintaID) references Vinhos.Quinta(Telefone) on delete cascade, 
);

CREATE TABLE Vinhos.Existe(
     VinhoId            validint,
     QuintaID           varchar(9) not null,
     foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
     foreign key (QuintaID) references Vinhos.Quinta(Telefone) on delete cascade, 
);
CREATE TABLE Vinhos.Existe(
     VinhoId            validint,
     RegiaoId                validint,
     foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
     foreign key (RegiaoId) references Vinhos.Regiao(Id) on delete cascade,

);

--insert into Vinhos.Users();
--insert into Vinhos.Owner();
--insert into Vinhos.OwnerShip();
--insert into Vinhos.Vinho();
--insert into Vinhos.Quinta();
--insert into Vinhos.Castas();
--insert into Vinhos.Tem();
--insert into Vinhos.Participa();
--insert into Vinhos.Regiao();
--insert into Vinhos.Enologos();
--insert into Vinhos.SaoJuri();
--insert into Vinhos.Distribuidor();
--insert into Vinhos.Distribui();