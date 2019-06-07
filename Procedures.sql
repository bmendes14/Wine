--################################################
-- Procedures
--################################################

--################################################
-- GET Premios por concurso
--################################################
go
CREATE PROCEDURE Vinhos.ConcursoPremios(@ID int)
as 
	select Vinhos.Concursos.*, Vinhos.Posicoes.PosicoesNu,Vinhos.Vinho.Nome as VinhoNome,Vinhos.Vinho.ID as VinhoID from Vinhos.Concursos join Vinhos.Posicoes on Vinhos.Concursos.ID=Vinhos.Posicoes.CodigoConcurso join Vinhos.Vinho on Vinhos.Vinho.ID=Vinhos.Posicoes.VinhoID where Vinhos.Concursos.ID=@ID order by Vinhos.Posicoes.PosicoesNu asc;
go



--################################################
-- Insert Casta
--################################################
go
create procedure Vinhos.InsertCasta(@Aroma varchar(60), @Descricao varchar(800), @Nome varchar(60))
as 
	BEGIN  
	insert into Vinhos.Castas(Aroma, Descricao, Nome) values(@Aroma , @Descricao, @Nome)  
	END                   
go

--################################################
-- Insert Relation Wine and casta
--################################################
create procedure Vinhos.InsertTem(@VinhoID int, @CastaID int)
as 
	BEGIN  
	insert into Vinhos.Tem(VinhoId, CastasID) values(@VinhoID , @CastaID)  
	END                   
go

--################################################
-- Insert Casta and relation
--################################################
go
create procedure Vinhos.CastaRelationTem(@VinhoID int,@Aroma varchar(60), @Descricao varchar(800), @Nome varchar(60))
as 
	declare @CastaID int;
	BEGIN  
	insert into Vinhos.Castas(Aroma, Descricao, Nome) values(@Aroma , @Descricao, @Nome) 
	Set @CastaID=( SELECT max(Vinhos.Castas.ID) FROM Vinhos.Castas);
	insert into Vinhos.Tem(VinhoId, CastasID) values(@VinhoID , @CastaID) 
	END                   
go



--################################################
-- Delete Casta and relation
--################################################
create procedure Vinhos.DeleteCasta(@ID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Tem WHERE CastasID = @ID;
	DELETE FROM Vinhos.Castas WHERE ID = @ID;  
	END                   
go

-- exec Vinhos.InsertCasta 'Branco','ola','0la';
-- exec Vinhos.InsertTem 1,19;
-- exec Vinhos.DeleteCasta 20;
-- select * from Vinhos.Castas;
-- select * from Vinhos.Tem;


--################################################
-- Delete Casta and wine  relation
--################################################
go
create procedure Vinhos.DeleteCastaWineAssociation(@WineID int, @CastaID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Tem WHERE CastasID = @CastaID and VinhoId=@WineID ;
	END                   
go


--################################################
-- Insert Regiao
--################################################
create procedure Vinhos.InsertRegiao(@Solo varchar(60),@Clima varchar(60),@Nome varchar(60), @Codigo varchar(9))
as 
	BEGIN  
	insert into Vinhos.Regiao(Solo, Clima, Nome,Codigo) values(@Solo , @Clima, @Nome,@Codigo)  
	END                   
go

--################################################
-- Delete Regiao
--################################################
create procedure Vinhos.DeleteRegiao(@ID int)
as 
	BEGIN 
	DELETE FROM Vinhos.Regiao WHERE ID = @ID;  
	END                   
go
-- exec Vinhos.InsertRegiao 'ola','ola','ola','ola'
-- exec Vinhos.DeleteRegiao 9
-- go
--################################################
-- Insert Quinta
--################################################
create procedure Vinhos.InsertQuinta(@Nome varchar(60),@Morada varchar(60),@TamanhoProducao int,@Descicao varchar(1000), @Telefone varchar(9), @RegiaoID int)
as 
	BEGIN  
	insert into Vinhos.Quinta(Nome,Morada, TamanhoProducao,Descricao,Telefone,RegiaoID) values(@Nome,@Morada,@TamanhoProducao,@Descicao, @Telefone, @RegiaoID)  
	END                   
go


--################################################
-- Delete Quinta
--################################################
create procedure Vinhos.DeleteQuinta(@ID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Quinta where ID=@ID 
	DELETE FROM Vinhos.OwnerShip where Vinhos.OwnerShip.Quinta_ID =@ID   
	END                   
go




--################################################
-- Insert Enologo
--################################################
go
create procedure Vinhos.InsertEnologos(@Name varchar(60), @Nparticipacoes int, @NSocioEnologo int,@UserId int)
as 
	BEGIN  
	insert into Vinhos.Enologos(Nome,Nparticipacoes,NSocioEnologo,UserId) values(@Name , @Nparticipacoes,@NSocioEnologo,@UserId)  
	END                   
go

--exec Vinhos.InsertEnologos 'oi',12,11111,1;


--################################################
--Insert Wines
--################################################
go
create procedure Vinhos.InsertVinho(@Nome varchar(60),@PercentagemAlcool int,@Preco decimal, @Avaliacao int,@Descricao varchar(500),@InfoNutricional varchar(200),@TemperaturaServir varchar(7),@RegiaoID int, @QuintaID int )
as 
	BEGIN  
	insert into Vinhos.Vinho(Nome,PercentagemAlcool,Preco,Avaliacao,Descricao,InfoNutricional,TemperaturaServir,RegiaoID,QuintaID) values(@Nome,@PercentagemAlcool,@Preco, @Avaliacao,@Descricao,@InfoNutricional,@TemperaturaServir,@RegiaoID, @QuintaID)  
	END                   
go

--################################################
--Delete Wines
--################################################
create procedure Vinhos.DeleteVinho(@ID int )
as 
	BEGIN  
	DELETE FROM Vinhos.Vinho where ID=@ID  
	END                   
go

-- exec Vinhos.InsertVinho 'ola',1,1.2,10,'ola','ola','10',1,1
-- exec Vinhos.DeleteVinho 16
-- select * from Vinhos.Vinho;

--################################################
--Update Wines
--################################################
go
CREATE PROCEDURE Vinhos.UpdateVinho(@ID int,@Nome varchar(60),@PercentagemAlcool int,@Preco decimal, @Avaliacao int,@Descricao varchar(500),@InfoNutricional varchar(200),@TemperaturaServir varchar(7),@RegiaoID int, @QuintaID int)
as
	update Vinhos.Vinho SET Nome=@Nome,PercentagemAlcool=@PercentagemAlcool,Preco=@Preco,Avaliacao=@Avaliacao,Descricao=@Descricao,InfoNutricional=@InfoNutricional, TemperaturaServir=@TemperaturaServir,RegiaoID=@RegiaoID,QuintaID=@QuintaID	 WHERE ID = @ID;
go

--exec Vinhos.UpdateVinho ID ,Nome,PercentagemAlcool,Preco, Avaliacao,Descricao,InfoNutricional ,TemperaturaServir ,RegiaoID, QuintaID;

--################################################
--Update Região
--################################################
go
CREATE PROCEDURE Vinhos.UpdateRegiao(@Solo varchar(60),@Clima varchar(60),@Nome varchar(60), @Codigo varchar(9), @ID int)
as
	update Vinhos.Regiao set Solo=@Solo, Clima=@Clima, Nome=@Nome,Codigo=@Codigo where ID=@ID;
go


--################################################
--Update Quinta
--################################################
go
CREATE PROCEDURE Vinhos.UpdateQuinta(@Nome varchar(60),@Morada varchar(60),@TamanhoProducao int,@Descicao varchar(1000), @Telefone varchar(9), @RegiaoID int, @ID int)
as
	update Vinhos.Quinta set Nome=@Nome,Morada=@Morada, TamanhoProducao=@TamanhoProducao,Descricao=@Descicao,Telefone=@Telefone,RegiaoID=@RegiaoID where ID=@ID;
go
