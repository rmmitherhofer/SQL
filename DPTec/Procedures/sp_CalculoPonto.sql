USE DPtec

GO

CREATE Procedure sp_CalculoPonto
(
	@Month Varchar(13)
	,@Year Int
	,@cdFunc Int
	,@cdPonto Int
	,@Op Char(1) = NULL
)
As 
Declare 
	@Mes Int
	,@status int
	,@DtPontoFim Date
	,@msg Varchar(200)

--Para uso de Testes

--Declare 
--	@Month Varchar (12)
--	,@Year Int
--	,@Mes Int
--	,@cdPonto int
--	,@cdFunc int
--	,@Op char (1)
--	,@status int
--	,@DtPontoFim Date
--	,@msg Varchar(200)

--Set @Month = 'Outubro'
--set @Year = 2017
--set @cdFunc = 1
--Set @cdPonto = 1
--Set @Op = 'F'

BEGIN
	IF @Month = 'Janeiro'
		SET @Mes = 1
	ELSE IF @Month = 'Fevereiro'
		SET @Mes = 2
	ELSE IF @Month = 'Março'
		SET @Mes = 3
	ELSE IF @Month = 'Abril'
		SET @Mes = 4
	ELSE IF @Month = 'Maio'
		SET @Mes = 5
	ELSE IF @Month = 'Junho'
		SET @Mes = 6
	ELSE IF @Month = 'Julho'
		SET @Mes = 7
	ELSE IF @Month = 'Agosto'
		SET @Mes = 8
	ELSE IF @Month = 'Setembro'
		SET @Mes = 9
	ELSE IF @Month = 'Outubro'
		SET @Mes = 10
	ELSE IF @Month = 'Novembro'
		SET @Mes = 11
	ELSE IF @Month = 'Dezembro'
		SET @Mes = 12
	ELSE
		SET @Mes = @Month


	IF EXISTS (SELECT 
				cd_Matricula
				,nm_Funcionario
				,no_CPF 
				FROM  Funcionario
				WHERE cd_Matricula = @cdFunc)

		--update Ponto set ds_Mes = 10 where cd_Ponto = 1
	BEGIN
		SELECT
			@cdPonto =cd_Ponto
			,@status =cd_Status
			,@cdFunc =cd_Matricula
			,@DtPontoFim = dt_PeriodoFim
		FROM Ponto 
		WHERE MONTH(dt_PeriodoInicio) = @Mes
			AND	YEAR(dt_PeriodoInicio) = @Year
			AND MONTH(dt_PeriodoFim) = @Mes
			AND	YEAR(dt_PeriodoFim) = @Year			
			AND cd_Matricula = @cdFunc
			--AND cd_Status = 8
			--AND isnull(@cdFunc, 
					
					

		IF OBJECT_ID('tempdb..#Detalhe_Ponto') IS NOT NULL    
		DROP TABLE #Detalhe_Ponto

		CREATE TABLE #Detalhe_Ponto
		(
			cd_Ponto INT
			,dt_data DATE
			,ds_DiaSemana INT
			,hr_Entrada INT
			,hr_Saida_Almoco INT
			,hr_Volta_Almoco INT 
			,hr_Saida INT
			,hr_Entrada_Padrao INT
			,hr_Saida_Almoco_Padrao INT
			,hr_Volta_Almoco_Padrao INT 
			,hr_Saida_Padrao INT
			,hrsTotais INT
			,hrsTotaisExtra INT
		)

		--Memoria calculo de Horas
		--Converti horas e Minutos para Segundos
		INSERT INTO #Detalhe_Ponto
		SELECT
			DP.cd_Ponto
			,DP.dt_Data
			,ds_DiaSemana
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Entrada),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Entrada),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Entrada),108), 2))) % 60)) / 60)) *3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Entrada),108), 2))) % 60) * 60 as HoraEntrada
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Saida_Almoco),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Almoco),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Saida_Almoco),108), 2))) % 60)) / 60))*3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Almoco),108), 2))) % 60) * 60 as HoraSaidaAlmoco
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Volta_Almoco),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Volta_Almoco),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Volta_Almoco),108), 2))) % 60)) / 60)) *3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Volta_Almoco),108), 2))) % 60) * 60 as HoraVoltaAlmoco
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Saida),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Saida),108), 2))) % 60)) / 60)) * 3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida),108), 2))) % 60)* 60 as HoraSaida
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Entrada_Padrao),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Entrada_Padrao),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Entrada_Padrao),108), 2))) % 60)) / 60))*3600  +  (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Entrada_Padrao),108), 2))) % 60) * 60 as HoraEntradaPadrao
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Saida_Almoco_Padrao),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Almoco_Padrao),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Saida_Almoco_Padrao),108), 2))) % 60)) / 60))*3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Almoco_Padrao),108), 2))) % 60) * 60 as HoraSaidaAlmocoPadrao
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Volta_Almoco_Padrao),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Volta_Almoco_Padrao),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Volta_Almoco_Padrao),108), 2))) % 60)) / 60))*3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Volta_Almoco_Padrao),108), 2))) % 60) * 60 as HoraVoltaAlmocoPadrao
			,(SUM (CONVERT (INT, LEFT (Convert(Varchar(5),(DP.hr_Saida_Padrao),108), 2))) + (((SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Padrao),108), 2)))) - (SUM (CONVERT (INT, RIGHT (CONVERT(VARCHAR(5),(DP.hr_Saida_Padrao),108), 2))) % 60)) / 60)) *3600 + (SUM (CONVERT (INT, RIGHT (Convert(Varchar(5),(DP.hr_Saida_Padrao),108), 2))) % 60) * 60 as HoraSaidaPadrao
			,NULL
			,NULL
		FROM DetalhamentoPonto DP
			INNER JOIN Ponto P ON P.cd_Ponto = DP.cd_Ponto 
		WHERE P.cd_Ponto =  @cdPonto
			AND MONTH(DP.dt_Data) = @Mes
			AND YEAR(DP.dt_data) = @Year				
		GROUP BY DP.cd_Ponto
			,DP.dt_Data
			,DP.hr_Entrada
			,DP.ds_DiaSemana
			,DP.hr_Saida_Almoco
			,DP.hr_Volta_Almoco
			,DP.hr_Saida
			,DP.ds_Observacao
			,DP.hr_Entrada_Padrao
			,DP.hr_Saida_Almoco_Padrao
			,DP.hr_Volta_Almoco_Padrao
			,DP.hr_Saida_Padrao


		--select 'Converti Para Seguntos', * from #Detalhe_Ponto
		
		IF OBJECT_ID('tempdb..#MemoriaCalculoPonto') IS NOT NULL    
		DROP TABLE #MemoriaCalculoPonto

		CREATE TABLE #MemoriaCalculoPonto
		(
			cd_Ponto INT
			,dt_data DATE
			,ds_DiaSemana INT
			,hr_Entrada INT
			,min_Entrada INT
			,hr_Saida_Almoco INT
			,min_Saida_Almoco INT
			,hr_Volta_Almoco INT
			,min_Volta_Almoco INT
			,hr_Saida INT
			,min_Saida INT
			,hr_Entrada_Padrao INT
			,min_Entrada_Padrao INT
			,hr_Saida_Almoco_Padrao INT
			,min_Saida_Almoco_Padrao INT
			,hr_Volta_Almoco_Padrao INT
			,min_Volta_Almoco_Padrao INT
			,hr_Saida_Padrao INT
			,min_Saida_Padrao INT
			,TotalHoras INT
			,TotalMin INT
			,TotalHoraAlmoco INT
			,TotalMinAlmoco INT
			,TotalHoraAlmocoPadrao INT
			,TotalMinAlmocoPadrao INT
			,TotalHorasPadrao INT
			,TotalMinPadrao INT	
		)

		--DIAS NAO UTEIS Separa Minutos e Horas em Colunas separadas e converte de segundos para numeros Inteiros
		INSERT INTO #MemoriaCalculoPonto
		SELECT	
			cd_Ponto 
			,dt_data
			,ds_DiaSemana 
			,(hr_Entrada / 60 ) / 60 hr_Entrada
			,(hr_Entrada / 60 ) % 60 hr_Entrada
			,(hr_Saida_Almoco / 60 ) / 60 hr_Saida_Almoco
			,(hr_Saida_Almoco / 60 ) % 60   hr_Saida_Almoco
			,(hr_Volta_Almoco / 60 ) / 60  hr_Volta_Almoco
			,(hr_Volta_Almoco / 60 ) % 60   hr_Volta_Almoco
			,(hr_Saida / 60 ) / 60  hr_Saida
			,(hr_Saida / 60 ) % 60    hr_Saida
			,ISNULL((hr_Entrada_Padrao / 60 ) / 60, 0) hr_Entrada_Padrao
			,ISNULL((hr_Entrada_Padrao / 60 ) % 60, 0)    hr_Entrada_Padrao
			,ISNULL((hr_Saida_Almoco_Padrao / 60 ) / 60, 0) hr_Saida_Almoco_Padrao
			,ISNULL((hr_Saida_Almoco_Padrao / 60 ) % 60, 0)   hr_Saida_Almoco_Padrao
			,ISNULL((hr_Volta_Almoco_Padrao / 60 ) / 60, 0) hr_Volta_Almoco_Padrao
			,ISNULL((hr_Volta_Almoco_Padrao / 60 ) % 60, 0)   hr_Volta_Almoco_Padrao
			,ISNULL((hr_Saida_Padrao / 60 ) / 60, 0) hr_Saida_Padrao
			,ISNULL((hr_Saida_Padrao / 60 ) % 60, 0) hr_Saida_Padrao
			,(((hr_Saida / 60 ) - (hr_Entrada / 60)) - ((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60))) /60 Total_hr_Trabalhada
			,(((hr_Saida / 60 ) - (hr_Entrada / 60)) - ((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60))) %60 Total_Min_Trabalhada
			,((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60)) / 60 Total_Hr_Almoco
			,((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60)) % 60 Total_Min_Almoco 
			,ISNULL(((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60)) / 60, 0) Total_Hr_Almoco_Padrao
			,ISNULL(((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60)) % 60, 0) Total_Min_Almoco_Padrao
			,ISNULL((((hr_Saida_Padrao / 60 ) - (hr_Entrada_Padrao / 60)) - ((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60))) /60, 0) Total_hr_Padrao
			,ISNULL((((hr_Saida_Padrao / 60 ) - (hr_Entrada_Padrao / 60)) - ((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60))) %60, 0) Total_Min_Padrao
		FROM #Detalhe_Ponto
		WHERE MONTH(dt_data) = @Mes
			AND Year(dt_data) = @Year
			AND cd_Ponto = @cdPonto
			AND ds_DiaSemana IN (7, 1)

		-- DIAS UTEIS Separa Minutos e Horas em Colunas separadas e converte de segundos para numeros Inteiros
		INSERT INTO #MemoriaCalculoPonto
		SELECT	
			cd_Ponto 
			,dt_data
			,ds_DiaSemana 
			,(hr_Entrada / 60 ) / 60 hr_Entrada
			,(hr_Entrada / 60 ) % 60 hr_Entrada
			,(hr_Saida_Almoco / 60 ) / 60 hr_Saida_Almoco
			,(hr_Saida_Almoco / 60 ) % 60   hr_Saida_Almoco
			,(hr_Volta_Almoco / 60 ) / 60  hr_Volta_Almoco
			,(hr_Volta_Almoco / 60 ) % 60   hr_Volta_Almoco
			,(hr_Saida / 60 ) / 60  hr_Saida
			,(hr_Saida / 60 ) % 60    hr_Saida
			,ISNULL((hr_Entrada_Padrao / 60 ) / 60, 0) hr_Entrada_Padrao
			,ISNULL((hr_Entrada_Padrao / 60 ) % 60, 0)    hr_Entrada_Padrao
			,ISNULL((hr_Saida_Almoco_Padrao / 60 ) / 60, 0) hr_Saida_Almoco_Padrao
			,ISNULL((hr_Saida_Almoco_Padrao / 60 ) % 60, 0)   hr_Saida_Almoco_Padrao
			,ISNULL((hr_Volta_Almoco_Padrao / 60 ) / 60, 0) hr_Volta_Almoco_Padrao
			,ISNULL((hr_Volta_Almoco_Padrao / 60 ) % 60, 0)   hr_Volta_Almoco_Padrao
			,ISNULL((hr_Saida_Padrao / 60 ) / 60, 0) hr_Saida_Padrao
			,ISNULL((hr_Saida_Padrao / 60 ) % 60, 0) hr_Saida_Padrao
			,(((hr_Saida / 60 ) - (hr_Entrada / 60)) - ((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60))) /60 Total_hr_Trabalhada
			,(((hr_Saida / 60 ) - (hr_Entrada / 60)) - ((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60))) %60 Total_Min_Trabalhada
			,((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60)) / 60 Total_Hr_Almoco
			,((hr_Volta_Almoco / 60) - (hr_Saida_Almoco / 60)) % 60 Total_Min_Almoco 
			,ISNULL(((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60)) / 60, 0) Total_Hr_Almoco_Padrao
			,ISNULL(((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60)) % 60, 0) Total_Min_Almoco_Padrao
			,ISNULL((((hr_Saida_Padrao / 60 ) - (hr_Entrada_Padrao / 60)) - ((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60))) /60, 0) Total_hr_Padrao
			,ISNULL((((hr_Saida_Padrao / 60 ) - (hr_Entrada_Padrao / 60)) - ((hr_Volta_Almoco_Padrao / 60) - (hr_Saida_Almoco_Padrao / 60))) %60, 0) Total_Min_Padrao
		FROM #Detalhe_Ponto
		WHERE 	MONTH(dt_data) = @Mes
			AND Year(dt_data) = @Year
			AND cd_Ponto = @cdPonto
			AND ds_DiaSemana NOT IN (7, 1)

		--Select 'Separa Minutos ', * from #MemoriaCalculoPonto

		IF OBJECT_ID('tempdb..#MemoriaCalculoPontoExtra') IS NOT NULL    
		DROP TABLE #MemoriaCalculoPontoExtra

		CREATE TABLE #MemoriaCalculoPontoExtra
		(
			cd_Ponto INT
			,dt_data DATE
			,TotalHoraAlmoco INT
			,TotalMinAlmoco INT
			,TotalHoras INT
			,TotalMin INT
			,TotalHoraAlmocoPadrao INT
			,TotalMinAlmocoPadrao INT
			,TotalHorasPadrao INT
			,TotalMinPadrao INT 
			,TotalHorasExtra INT
			,TotalMinExtra INT
		)

		-- Realiza o calculo de horas Trabalhadas em Dias Uteis
		INSERT INTO #MemoriaCalculoPontoExtra
		SELECT 
			cd_Ponto
			,dt_data
			,(((TotalHoraAlmoco * 3600)/60)/60) TotalHoraAlmoco
			,(((TotalMinAlmoco * 60) /60) %60)  TotalMinAlmoco
			,(((TotalHoras * 3600)/60)/60) TotalHorasTrabalhada
			,(((TotalMin * 60)/60)%60) TotalMinTrabalhado
			,(((TotalHoraAlmocoPadrao * 3600)/60)/60)  TotalHoraAlmocoPadrao
			,(((TotalMinAlmocoPadrao * 60)/60)%60)  TotalMinAlmocoPadrao
			,(((TotalHorasPadrao * 3600)/60) / 60) TotalHorasPadrao
			,(((TotalMinPadrao * 60) / 60) % 60) TotalMinPadrao
			,ISNULL(((TotalHoras * 3600)/60)/60, 0) -  (((TotalHorasPadrao * 3600)/60)/60) TotalHorasExtra
			,ISNULL(((TotalMin * 60)/60) % 60, 0) - (((TotalMinPadrao * 60) / 60) % 60) TotalMinExtra	
		FROM #MemoriaCalculoPonto
		WHERE ds_DiaSemana not in (1, 7)


		-- Realiza o calculo de horas Trabalhadas em Dias Não Uteis
		INSERT INTO #MemoriaCalculoPontoExtra
		SELECT 
			cd_Ponto
			,dt_data
			,(((TotalHoraAlmoco * 3600)/60)/60) TotalHoraAlmoco
			,(((TotalMinAlmoco * 60) /60) %60)  TotalMinAlmoco

			,(((TotalHoras * 3600)/60)/60) TotalHorasTrabalhada
			,(((TotalMin * 60)/60)%60) TotalMinTrabalhado

			,(((TotalHoraAlmocoPadrao * 3600)/60)/60)  TotalHoraAlmocoPadrao
			,(((TotalMinAlmocoPadrao * 60)/60)%60)  TotalMinAlmocoPadrao

			,(((TotalHorasPadrao * 3600)/60) / 60) TotalHorasPadrao
			,(((TotalMinPadrao * 60) / 60) % 60) TotalMinPadrao

			,ISNULL(((TotalHoras * 3600)/60) / 60, 0)  TotalHorasExtra
			,ISNULL(((TotalMin * 60)/60) % 60, 0) TotalMinExtra	
		FROM #MemoriaCalculoPonto
		WHERE ds_DiaSemana in (1, 7)
				

		--Select 'calculo de horas ', * from #MemoriaCalculoPontoExtra

		DECLARE @Saldo VARCHAR(8)
				,@SaldoPadrao VARCHAR(8)
		SELECT
			@Saldo = (CONVERT (VARCHAR(18),(((SUM(((MCE.TotalHorasExtra * 3600)/60)/60) * 3600 + SUM(((MCE.TotalMinExtra * 60)/60)%60) * 60) / 60) /60))) + ':' +
			REPLACE(CONVERT(VARCHAR(18),(((SUM(((MCE.TotalHorasExtra * 3600)/60)/60) * 3600 + SUM(((MCE.TotalMinExtra * 60)/60)%60) * 60) / 60) % 60)),'-','')
			,@SaldoPadrao = (CONVERT (Varchar(18),(((SUM(((MCE.TotalHorasPadrao * 3600)/60)/60) * 3600 + SUM(((MCE.TotalMinPadrao * 60)/60)%60) * 60) / 60) /60))) + ':' +
			REPLACE(CONVERT(VARCHAR(18),(((SUM(((MCE.TotalHorasPadrao * 3600)/60)/60) * 3600 + SUM(((MCE.TotalMinPadrao * 60)/60)%60) * 60) / 60) % 60)),'-','')
		FROM Ponto P
			LEFT JOIN #MemoriaCalculoPontoExtra MCE ON P.cd_ponto = MCE.cd_Ponto
		WHERE MCE.cd_Ponto = @cdPonto 
			AND month(MCE.dt_data) = @Mes

		IF @STATUS = 8 
		BEGIN
			IF (@Op = 'F')
			BEGIN
				IF (GETDATE() > @DtPontoFim) 
				BEGIN
					UPDATE p
					SET p.hr_Saldo = @Saldo
						,p.hr_Saldo_Referencia = @SaldoPadrao
						,p.cd_Status = 9 -- Fechado
					FROM Ponto P
						INNER JOIN #MemoriaCalculoPontoExtra MCE ON P.cd_ponto = MCE.cd_Ponto
					WHERE MCE.cd_Ponto = @cdPonto 
						AND MONTH(MCE.dt_data) = @Mes
					SET @msg = 'Registros Atualizados com Sucesso'
					GOTO FIM
				END
				ELSE
				BEGIN 
					SET @msg = 'Não é possivel realizar o fechamento da Folha antes do periodo de fechamento'
					GOTO FIM
				END
			END
			ELSE						
				UPDATE p
				SET p.hr_Saldo = @Saldo
					,P.hr_Saldo_Referencia = @SaldoPadrao
				FROM Ponto P
					INNER JOIN #MemoriaCalculoPontoExtra MCE ON P.cd_ponto = MCE.cd_Ponto
				WHERE MCE.cd_Ponto = @cdPonto 
					and month(MCE.dt_data) = @Mes

		end		
		--Select * from Ponto
		Select distinct
			P.*
			,MCP.dt_data
			,Case 
				When (Dp.ds_DiaSemana = 1) then
					'Domingo'
				When (Dp.ds_DiaSemana = 2) then
					'Segunda-feira'
				When (Dp.ds_DiaSemana = 3) then
					'Terça-feira'
				When (Dp.ds_DiaSemana = 4) then
					'Quarta-feira'
				When (Dp.ds_DiaSemana = 5) then
					'Quinta-feira'
				When (Dp.ds_DiaSemana = 6) then
					'Sexta-feira'
				When (Dp.ds_DiaSemana = 7) then
					'Sabádo'
			end as Dia
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Entrada_Padrao,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Entrada_Padrao,'00')) as Horario_Entrada
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Saida_Almoco_Padrao,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Saida_Almoco_Padrao,'00')) as Horario_Almoco
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Volta_Almoco_Padrao,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Volta_Almoco_Padrao,'00')) as Horario_Retorno_Almoco
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Saida_Padrao,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Saida_Padrao,'00')) as Horario_Saida

			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Entrada,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Entrada,'00')) as Marcacoes_Realizadas_Entrada
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Saida_Almoco,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Saida_Almoco,'00')) as Marcacoes_Realizadas_Almoco
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Volta_Almoco,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Volta_Almoco,'00')) as Marcacoes_Realizadas_RetornoAlmoco
			,CONVERT(VARCHAR(8), FORMAT(MCP.hr_Saida,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.min_Saida,'00')) as Marcacoes_Realizadas_Saida

			,CONVERT(VARCHAR(8), FORMAT(MCP.TotalHoras,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.TotalMin,'00')) as HoraTrabalhada
			,CONVERT(VARCHAR(8), FORMAT(MCP.TotalHoraAlmoco,'00')) + ':' + CONVERT(VARCHAR(8), FORMAT(MCP.TotalMinAlmoco,'00')) as HoraAlmoco
			,CONVERT(VARCHAR(8), FORMAT(MCPE.TotalHorasExtra,'00') ) + ':' + CONVERT(VARCHAR(8), FORMAT(MCPE.TotalMinExtra,'00')) as HoraAdicional

		FROM #MemoriaCalculoPonto MCP
			INNER JOIN #MemoriaCalculoPontoExtra MCPE ON MCPE.cd_Ponto = MCP.cd_Ponto AND MCPE.dt_data= MCP.dt_data
			INNER JOIN vwPonto P ON P.cd_Ponto = MCP.cd_Ponto
			INNER JOIN DetalhamentoPonto DP ON DP.cd_Ponto = P.cd_Ponto AND DP.dt_Data  = MCPE.dt_data
		WHERE MCP.cd_Ponto = @cdPonto 
			AND MONTH(MCP.dt_data) = @Mes
		FIM:
		IF @msg IS NOT NULL
			SELECT @msg AS msg
	END
END