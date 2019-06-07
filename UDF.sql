--################################################
--              Funtions
--################################################

go
create function Vinhos.WineList() returns table 
as
	return(select Nome from Vinhos.Vinho);

go


-- select * from Vinhos.WineList();
--###############################################
-- Get all the names, id of all  Wine 
--###############################################

go
create function Vinhos.WineName() returns table
as 
	return(select Nome,ID from Vinhos.Vinho);
go

-- select * from Vinhos.WineName();

--###############################################
-- Get all the info from a determinated Wine ID
--###############################################


--declare @id int = 1;
--print @id
--exec Vinhos.WineCaracteristics @id;
go
create function Vinhos.WineCaracteristics( @ID int) returns table
as 
	return(Select Vinhos.Vinho.*,Vinhos.Quinta.Nome as QuintaNome, Vinhos.Regiao.Nome as RegiaoNome from (Vinhos.Vinho join Vinhos.Quinta on Vinhos.Vinho.QuintaID = Vinhos.Quinta.ID) join Vinhos.Regiao on Vinhos.Vinho.RegiaoID = Vinhos.Regiao.ID  where Vinhos.Vinho.ID = @ID) ;
go

-- select * from Vinhos.WineCaracteristics(1);


--################################################
-- Get number of wines in our database
--################################################

go
create function Vinhos.CountWines() returns table
as 
	return(Select count(*) as counts from Vinhos.Vinho);
go

-- select * from Vinhos.CountWines();

--################################################
-- Get name of a determinated wine in our database
--################################################

go
create function Vinhos.getRandom(@ID int) returns table
as 
	return(Select Vinhos.Vinho.Nome from Vinhos.Vinho where Vinhos.Vinho.ID=@ID);
go
--select * from Vinhos.getRandom(1);

--################################################
-- Get number of Quintas in our database
--################################################
go 
create function Vinhos.CountQuintas() returns table
as
    return (Select count(*) as counts from Vinhos.Quinta);
go

--################################################
-- Get name of Quinta by id
--################################################

go 
create function Vinhos.getRandomQuinta(@ID int) returns table
as
    return (Select Nome,ID from Vinhos.Quinta where ID=@ID);
go
--################################################
-- Get Name of all Quintas
--################################################
go 
create function Vinhos.QuintasName() returns table
as
    return (Select Nome,ID from Vinhos.Quinta);
go

--################################################
-- Get Quintas from one region in our database
--################################################
go 
create function Vinhos.getQuintaByReg (@ID int) returns table 
as 
    return (Select Vinhos.Quinta.Nome, Vinhos.Quinta.ID from Vinhos.Quinta where Vinhos.Quinta.RegiaoID=@ID);
go


--################################################
-- Get all info from Distribuidor
--################################################

create function Vinhos.GetDis(@ID int) returns table
as 
	return(select * from Vinhos.Distribuidor where Vinhos.Distribuidor.ID=@ID);
go

--################################################
-- Get all Distribuidores from a quinta
--################################################

create function Vinhos.GetDistQuinta(@ID int) returns table
as 
	return(select Vinhos.Distribui.DistribuiID, Vinhos.Distribuidor.Nome 
			from Vinhos.Distribui,Vinhos.Distribuidor 
			 where Vinhos.Distribui.DistribuiID=Vinhos.Distribuidor.ID and Vinhos.Distribui.QuintaID=@ID);
go


--################################################
-- Get all info from Quintas
--################################################


-- exec Vinhos.QuintaInfo 'ID';
create function Vinhos.QuintaInfo(@ID int) returns table
as 
	return(select Vinhos.Quinta.*,Vinhos.Regiao.Nome as RegiaoNome,Vinhos.Owner.Nome as OnwerNome,Vinhos.Owner.ID as OwnerID from ((Vinhos.Quinta join Vinhos.Regiao on Vinhos.Quinta.RegiaoID=Vinhos.Regiao.ID) join Vinhos.OwnerShip on Vinhos.Quinta.ID = Vinhos.OwnerShip.Quinta_ID)
join Vinhos.Owner on Vinhos.OwnerShip.Owner_ID = Vinhos.Owner.ID
 where Vinhos.Quinta.ID=@ID);
go

-- select * from Vinhos.QuintaInfo(1);


--################################################
-- Get all names and id from Quintas
--################################################

go
create function Vinhos.QuintaName() returns table
as 
	return(select Nome,ID from Vinhos.Quinta);
go
-- select * from Vinhos.QuintaName();

--################################################
-- Get all names and id from Regiao
--################################################

go
create function Vinhos.RegiaoName() returns table
as 
	return(select Nome,ID from Vinhos.Regiao);
go
-- select * from Vinhos.RegiaoName();
--EXEC Vinhos.QuintaName;

--################################################
-- Get all info from Regiao
--################################################

--exec Vinhos.RegiaoInfo 1;
go
create function Vinhos.RegiaoInfo(@ID INT) returns table
as 
	return(select * from Vinhos.Regiao where Vinhos.Regiao.ID=@ID);
go
-- select * from Vinhos.RegiaoInfo(1);


--################################################
-- Get all info from Owner
--################################################

go
create function Vinhos.OwnerInfo(@ID INT) returns table
as 
	return(select * from Vinhos.Owner where Vinhos.Owner.ID=@ID);
go
-- select * from Vinhos.OwnerInfo(1);




--################################################
-- Get Name and Numbe of partner of Enologo
--################################################
go
create function Vinhos.Enologo() returns table
as
	return(select Vinhos.Enologos.Nome,Vinhos.Enologos.NSocioEnologo from Vinhos.Enologos);
go

-- select * from Vinhos.Enologo();



--################################################
-- Get Castas associate with wine
--################################################
go
create function Vinhos.CastasAssociadaVinho(@ID int) returns table
as
	return(select Vinhos.Castas.Nome,Vinhos.Castas.ID from Vinhos.Tem, Vinhos.Castas Where Vinhos.Tem.VinhoId=@ID and Vinhos.Castas.ID=Vinhos.Tem.CastasID);
go

-- select * from  Vinhos.CastasAssociadaVinho(1);


--################################################
-- Get All Castas 
--################################################
go
create function Vinhos.ALLCastas() returns table
as
	return(select Vinhos.Castas.Nome,Vinhos.Castas.ID from Vinhos.Castas);
go

-- select * from  Vinhos.ALLCastas();

--################################################
-- get all concursos name
--################################################
go
create function Vinhos.ConcursoName() returns table
as 
	return(select * from Vinhos.Concursos );
go



--################################################
-- get Enologo info
--################################################
go
create function Vinhos.EnologoNames(@ID int) returns table
as
	return(select Vinhos.Enologos.Nparticipacoes, Vinhos.Enologos.NSocioEnologo,Vinhos.Users.Nome,Vinhos.Users.DataNascimento,Vinhos.Users.NIF from Vinhos.Enologos join Vinhos.Users on Vinhos.Enologos.UserId=Vinhos.Users.NIF where Vinhos.Enologos.NSocioEnologo=@ID );
go


--################################################
-- get Enologo wine's association
--################################################
go
create function Vinhos.EnologoAssociatioWine(@ID int) returns table
as
	return(select  Vinhos.Vinho.Nome as VinhoNome, Vinhos.Vinho.ID AS Vinhoid from Vinhos.Enologos join Vinhos.VinhosAssociados on Vinhos.Enologos.NSocioEnologo=Vinhos.VinhosAssociados.Enologo_ID JOIN Vinhos.Vinho on Vinhos.VinhosAssociados.Vinho_ID=Vinhos.Vinho.ID where Vinhos.Enologos.NSocioEnologo=@ID );
go


