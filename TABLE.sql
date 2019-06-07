go
create type validint from int not null;
go
create type validname from varchar(60) not null;
go


create table Vinhos.Users(
    Nome                    validname,   
    DataNascimento          date,
    Pass                    validname,
    Salt                    varchar(15),
    NIF                     varchar(12) not null,
	primary key(NIF),
);
--drop table Vinhos.Owner;
create table Vinhos.Owner(
    Nome                    validname,  
    Grupo                   validname, 
    Telefone                varchar(15),
    ID                      validint IDENTITY(1,1),
    UserID                  varchar(12) not null,
	primary key(ID),
    foreign key (UserID) references Vinhos.Users(NIF) on delete cascade,
);

create table Vinhos.Enologos(  
    Nome                    validname,
    Nparticipacoes          int,
    NSocioEnologo           validint,
    UserId                  varchar(12) not null,
    primary key (NSocioEnologo),
    foreign key (UserId) references  Vinhos.Users(NIF)  on delete cascade, 
);

create table Vinhos.Distribuidor(
    Nome                    varchar(200) not null,
    Adress                  VARCHAR(20),
    ID                      validint IDENTITY(1,1),
    primary key (ID),
);


create table Vinhos.Regiao(  
    Solo              validname,
    Clima             validname,
    Nome              validname,
    Codigo            VARCHAR(9),
    ID                validint IDENTITY(1,1),
    primary key(ID),
);

create table Vinhos.Quinta(
    Nome                    validname,   
    Morada                  varchar(9) not null,
    TamanhoProducao         int,
    Descricao               VARCHAR(1000),
    Telefone                varchar(9) ,
    ID                      validint IDENTITY(1,1) ,
    RegiaoID                validint,
    primary key(ID),
    foreign key(RegiaoID) references Vinhos.Regiao(ID) on DELETE CASCADE,
);


create table Vinhos.Vinho(
    Nome                    validname,  
    PercentagemAlcool       validint,
    Preco                   decimal(5,2),
    Avaliacao               int,
    Descricao               VARCHAR(500),
    InfoNutricional         VARCHAR(200),
    ID                      validint IDENTITY(1,1),
    TemperaturaServir       varchar(7),
    RegiaoID                validint,
    QuintaID                validint,                  
    primary key(ID),
    foreign key(RegiaoID) references Vinhos.Regiao(ID) on DELETE CASCADE,
    foreign key(QuintaID) references Vinhos.Quinta(ID) ,
);

create table Vinhos.Castas(  
    Aroma                   validname,
    ID                      validint  IDENTITY(1,1),
    Descricao               VARCHAR(800),
    Nome                    validname,
    primary key(ID),
);

create table Vinhos.Derivados(
    Nome                    validname,  
    Descricao               VARCHAR(60),
    ID                      validint IDENTITY(1,1),
    QuintaID                validint,
    primary key(ID),
    foreign key(QuintaID) references Vinhos.Quinta(ID) on DELETE CASCADE,
);

create table Vinhos.Concursos(  
    Premiacoes        varchar(20),
    ID    validint IDENTITY(1,1),
    CodigoConcurso validname,
    primary key (ID),
);


create table Vinhos.OwnerShip(  
    Owner_ID           validint,
    Quinta_ID          validint,
    foreign key (Quinta_ID) references Vinhos.Quinta(ID)  ,
    foreign key (Owner_ID) references Vinhos.Owner(ID)  , 
);

create table Vinhos.Tem(  
    VinhoId           validint,
    CastasID          validint,
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
    foreign key (CastasID) references Vinhos.Castas(ID)  on delete cascade, 
);

create table Vinhos.VinhosAssociados(
    Enologo_ID         validint,
    Vinho_ID           validint,
    foreign key (Enologo_ID) references Vinhos.Enologos(NSocioEnologo)  on delete cascade,
    foreign key (Vinho_ID) references Vinhos.Vinho(ID)  on delete cascade,
);

create table Vinhos.Participa( 
    CodigoConcurso    validint, 
    VinhoId           validint,
    foreign key (CodigoConcurso) references Vinhos.Concursos(ID)  on delete cascade, 
    foreign key (VinhoId) references Vinhos.Vinho(ID)  on delete cascade,
);

create table Vinhos.SaoJuri(  
    SocioEnologo         validint,
    ConcursoID           validint,
    foreign key (SocioEnologo) references Vinhos.Enologos(NSocioEnologo)  on delete cascade,
    foreign key (ConcursoID) references Vinhos.Concursos(ID)  on delete cascade, 
);

create table Vinhos.Distribui(  
    QuintaID           validint,
    DistribuiID        validint,
    foreign key (QuintaID) references Vinhos.Quinta(ID) on delete cascade, 
    foreign key (DistribuiID) references Vinhos.Distribuidor(ID) on delete cascade,
);

create table Vinhos.Posicoes(
    PosicoesNu          validint,
    CodigoConcurso      validint,
    VinhoID             validint,
    foreign key (CodigoConcurso) references Vinhos.Concursos(ID)  on delete cascade, 
    foreign key (VinhoID) references Vinhos.Vinho(ID)  on delete cascade,
);


