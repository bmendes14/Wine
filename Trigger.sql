go
CREATE TRIGGER Vinhos.ValidateTem ON Vinhos.Tem
INSTEAD OF UPDATE,INSERT
as
begin
	Select *
	Into   #Temp
	From   inserted

	WHILE (SELECT count(*) FROM #Temp) >0
	begin
		DECLARE @CastaID as int;
		DECLARE @VinhoID as int;
		SELECT TOP 1 @CastaID = CastasID FROM #Temp;
		Select top 1 @VinhoID = VinhoID FROM #Temp
		if  (SELECT count(*) FROM Vinhos.Tem WHERE Vinhos.Tem.CastasID=@CastaID and Vinhos.Tem.VinhoId=@VinhoID) > 0
		begin
			DELETE #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
			RAISERROR('We already have that realtion', 16, 1);
		end
		ELSE
		begin
			insert into Vinhos.Tem SELECT * FROM #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
			DELETE #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
		end
	end	
end
go


--################################################
-- Triggers 
--################################################
go
CREATE TRIGGER Vinhos.ValidateEnologo ON Vinhos.Enologos
INSTEAD OF UPDATE,INSERT
as
begin
	Select *
	Into   #Temp
	From   inserted

	WHILE (SELECT count(*) FROM #Temp) >0
	begin
		DECLARE @NSocioEnologo as int;
		SELECT TOP 1 @NSocioEnologo = NSocioEnologo FROM #Temp;
		if  (SELECT count(*) FROM Vinhos.Enologos WHERE Vinhos.Enologos.NSocioEnologo=@NSocioEnologo) > 0
		begin
			DELETE #TEMP WHERE NSocioEnologo=@NSocioEnologo;
			RAISERROR('Enologo ALREADY HAVE THIS Number of partner', 16, 1);
		end
		ELSE
		begin
			insert into Vinhos.Enologos SELECT * FROM #TEMP WHERE NSocioEnologo=@NSocioEnologo;
			DELETE #TEMP WHERE NSocioEnologo=@NSocioEnologo;
		end
	end	
end
go


