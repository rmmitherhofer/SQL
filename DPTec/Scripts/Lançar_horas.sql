DECLARE 
	@getdate DATETIME,
	@cdPonto INT,
	@entrada DATETIME,
	@SaidaAlmoco DATETIME,
	@VoltaAlmoco DATETIME,
	@Saida DATETIME,
	@entrada2 DATETIME,
	@SaidaAlmoco2 DATETIME,
	@VoltaAlmoco2 DATETIME,
	@Saida2 DATETIME
SELECT 
	@getdate = '2018-10-31',
	@entrada2 = '2018-10-01 08:00:00',
	@SaidaAlmoco2 = '2018-10-01 12:30:00',
	@VoltaAlmoco2 = '2018-10-01 13:20:00',
	@Saida2 = '2018-10-01 18:00:00'

INSERT INTO	DPtec..ponto
VALUES
(
	1
	,MONTH(@getdate)
	,DATEADD(mm, DATEDIFF(mm,1,@getdate), 0)
	,DATEADD(mm, DATEDIFF(mm,1,@getdate) +1,-1)
	,8
	,220
	,NULL
)

SELECT 
	@cdPonto = cd_Ponto
FROM DPtec..Ponto
WHERE ds_Mes = MONTH(@getdate)

BEGIN
	DECLARE @Data DATE
			,@Datavalida DATE
	SET @Data = DATEADD(mm, DATEDIFF(mm,1,@getdate), 0)
	SELECT TOP 1
		@Datavalida = dt_Data 
	FROM DPTec..DetalhamentoPonto
	WHERE cd_Ponto = @cdPonto
	ORDER BY dt_Data DESC

	-- Se ja existir uma marcação ele acrescenda uma dia a mais e seta a data para os dias que falta marcação.
	IF DAY(@Data) != (DAY(@Datavalida) + 1)										
		SET @data  = (SELECT DATEADD(DAY,1,@Datavalida ))

	WHILE (@data <= @getdate)
	BEGIN
		IF (DATEPART(WEEKDAY,@data) NOT IN (6, 7, 1))
		BEGIN									
			SELECT
				@entrada = hr_Entrada
				,@SaidaAlmoco = hr_Saida_Almoco
				,@VoltaAlmoco = hr_Volta_Almoco
				,@Saida = hr_Saida
			FROM DPTec..HorasVigente
			WHERE ic_Ativo = 1
				AND ic_Semana IS NULL
		END
		ELSE IF (DATEPART(WEEKDAY,@data) = 6 )
		BEGIN									
			SELECT
				@entrada = hr_Entrada
				,@SaidaAlmoco = hr_Saida_Almoco
				,@VoltaAlmoco = hr_Volta_Almoco
				,@Saida = hr_Saida
			FROM DPTec..HorasVigente
			WHERE ic_Ativo = 1
				AND ic_Semana = 6
		END
		ELSE
		BEGIN									
			SELECT
				@entrada = hr_Entrada
				,@SaidaAlmoco = hr_Saida_Almoco
				,@VoltaAlmoco = hr_Volta_Almoco
				,@Saida = hr_Saida
			FROM DPTec..HorasVigente
			WHERE ic_Ativo = 1
				AND ic_Semana IN (7, 3)
		END	
		INSERT INTO DPTec..DetalhamentoPonto
		VALUES
		(
			@cdPonto
			,@Data
			,DATEPART(WEEKDAY,@Data)
			,0
			,0
			,0
			,@entrada2
			,@SaidaAlmoco2
			,@VoltaAlmoco2
			,@Saida2
			,NULL
			,@entrada
			,@SaidaAlmoco
			,@VoltaAlmoco
			,@Saida
		)
		SET @data  = (SELECT DATEADD(DAY,1,@data ))
		SELECT 
			@entrada2  = @entrada2 + 1
			,@SaidaAlmoco2 = @SaidaAlmoco2 + 1
			,@VoltaAlmoco2 = @VoltaAlmoco2 + 1
			,@Saida2 = @Saida2 + 1
	END
END

/*
DELETE FROM DetalhamentoPonto
DELETE FROM Ponto
DELETE FROM DPtec..DetalhePagamento
DELETE FROM DPtec..Pagamento


select * from Ponto
SELECT * FROM DetalhamentoPonto

SELECT * FROM DPtec..Pagamento
SELECT * FROM DPtec..DetalhePagamento
*/


