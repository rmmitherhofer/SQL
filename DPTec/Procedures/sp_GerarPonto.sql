USE DPtec

GO

Create Procedure sp_GerarPonto
(
		@cdMatricula int
)
--select DateAdd(mm, DateDiff(mm,1,GetDate()), 0), DateAdd(mm, DateDiff(mm,1,GetDate()) +1,-1), Getdate()
as

Declare
	@cd_ponto int
	,@cdMatriculaFunc int
	,@cdDetalhamentoPonto int
	,@entrada datetime
	,@SaidaAlmoco datetime
	,@VoltaAlmoco datetime
	,@Saida datetime
	,@entradaExtra datetime
	,@SaidaExtra datetime
	,@msg Varchar (500)
	,@getdate Smalldatetime


--Para Uso de Testes da Rotina
--Declare 
--	@cdMatricula int 
--	set @cdMatricula = 1

Begin
	Set @getdate = Getdate()
	--Busca matricula
	inicio:
	Select
		@cdMatriculaFunc = cd_Matricula
		--cd_Matricula
	From Funcionario
	where cd_Matricula = @cdMatricula 
		and cd_Status = 1

	--Select @cdMatriculaFunc as [@cdMatriculaFunc]
			
	--Se matricula estiver cadastrada ele segue e Verifica se existe Referencia de ponto para o mes gerado
	if @cdMatriculaFunc is not null
	begin
		Select 
			@cd_ponto = cd_Ponto
		from ponto
		where cd_Matricula = @cdMatricula 
			and ds_Mes = MONTH(@getdate)
		-- Select @cd_ponto as [@cd_ponto]			

		--Se Existir o Ponto ele busca a marcaçao Linha de marcaçao do dia 
		if @cd_ponto is not null --then
		begin
			Select 
				@cdDetalhamentoPonto = cd_DetalhamentoPonto
			from DetalhamentoPonto
			Where 	Day(dt_Data) = Day(@getdate)
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_Ponto = @cd_ponto

			--select @cdDetalhamentoPonto as [@cdDetalhamentoPonto]
			--Se existe Linha de marcaçao de ponto para o dia ele valida se existe marcaçoes realizadas.						
			If 	@cdDetalhamentoPonto is not null
			begin
				Select 
					@entrada = hr_Entrada
					,@SaidaAlmoco = hr_Saida_Almoco
					,@VoltaAlmoco = hr_Volta_Almoco
					,@Saida = hr_Saida
				from DetalhamentoPonto
				where cd_ponto = @cd_ponto 
					and Day(dt_Data) = Day(@getdate) 
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_DetalhamentoPonto = @cdDetalhamentoPonto
						-- se nao existir Linha de marcaçao do dia Cria Uma para O dia
				If	(@entrada is Null and @SaidaAlmoco is Null and @VoltaAlmoco is Null and @Saida is Null)
				begin
					update DetalhamentoPonto
						set hr_Entrada = @getdate
					where cd_ponto = @cd_ponto 
					and Day(dt_Data) = Day(@getdate) 
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_DetalhamentoPonto = @cdDetalhamentoPonto
					set @msg = 'Efetuado Marcação de Entrada'
				end
				else if (@entrada is not null and @SaidaAlmoco is Null and @VoltaAlmoco is Null and @Saida is Null)
				begin
					update DetalhamentoPonto
						set hr_Saida_Almoco = @getdate
					where cd_ponto = @cd_ponto 
					and Day(dt_Data) = Day(@getdate) 
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_DetalhamentoPonto = @cdDetalhamentoPonto
					set @msg = 'Efetuado Marcação de Saida Para Almoço'
				end
				else if (@entrada is not null and @SaidaAlmoco is not Null and @VoltaAlmoco is Null and @Saida is Null)
				begin
					update DetalhamentoPonto
						set hr_Volta_Almoco = @getdate
					where cd_ponto = @cd_ponto 
					and Day(dt_Data) = Day(@getdate) 
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_DetalhamentoPonto = @cdDetalhamentoPonto
					set @msg = 'Efetuado Marcação de retorno do Almoço'
				end
				else if (@entrada is not null and @SaidaAlmoco is not Null and @VoltaAlmoco is not Null and @Saida is Null)
				begin
					update DetalhamentoPonto
						set hr_Saida = @getdate
					where cd_ponto = @cd_ponto 
					and Day(dt_Data) = Day(@getdate) 
					and MONTH(dt_Data) = MONTH(@getdate)
					and year(dt_Data) = year(@getdate)  
					and cd_DetalhamentoPonto = @cdDetalhamentoPonto
					set @msg = 'Efetuado Marcação de Saida'
				end
				else
				begin
					set @msg ='Todas as marcações para o dia de hoje foram feitas Vá Embora'
				end
			End	
			else
			--Verifica se existe a primeira marcação do mes
			begin
				Declare @Data Date
						,@Datavalida Date
				Set @Data = DateAdd(mm, DateDiff(mm,1,@getdate), 0)
				Select top 1
					@Datavalida = dt_Data 
				from DetalhamentoPonto
					where cd_Ponto = @cd_ponto
					order by dt_Data desc

				-- Se ja existir uma marcação ele acrescenda uma dia a mais e seta a data para os dias que falta marcação.
				if Day(@Data) != (Day(@Datavalida) + 1)										
					Set @data  = (Select dateadd(DAY,1,@Datavalida ))
								
				while (@data < @getdate)
				begin
					--Select @data, @getdate as [While @data, @getdate]
					if (DATEPART(WEEKDAY,@data) not in (6, 7, 1))
					Begin									
						Select
							@entrada = hr_Entrada
							,@SaidaAlmoco = hr_Saida_Almoco
							,@VoltaAlmoco = hr_Volta_Almoco
							,@Saida = hr_Saida
						From HorasVigente
							where ic_Ativo = 1
							and ic_Semana is NULL
					End
					else if (DATEPART(WEEKDAY,@data) = 6 )
					Begin									
						Select
							@entrada = hr_Entrada
							,@SaidaAlmoco = hr_Saida_Almoco
							,@VoltaAlmoco = hr_Volta_Almoco
							,@Saida = hr_Saida
						From HorasVigente
							where ic_Ativo = 1
							and ic_Semana = 6
					End
					else
					Begin									
						Select
							@entrada = hr_Entrada
							,@SaidaAlmoco = hr_Saida_Almoco
							,@VoltaAlmoco = hr_Volta_Almoco
							,@Saida = hr_Saida
						From HorasVigente
							where ic_Ativo = 1
							and ic_Semana in (7, 3)
					End									
					Insert Into DetalhamentoPonto
					Values
					(
						--sq_DetalhamentoPonto.nextValue
						@cd_ponto						--cd_DetalhamentoPonto
						,@data						--cd_Ponto
						,DATEPART(WEEKDAY,@data)						--dt_Data
						,0								--ds_DiaSemana
						,0								--ic_Abono
						,0							--ic_Debito_Banco
						,null						--ic_Debito_Salario
						,null						--hr_Entrada
						,null						--hr_Saida_Almoco
						,null						--hr_Volta_Almoco
						,null						--hr_Saida
						,@entrada					--ds_Observacao
						,@SaidaAlmoco				--hr_Entrada_Padrao
						,@VoltaAlmoco				--hr_Saida_Almoco_Padrao
						,@Saida						--hr_Volta_Almoco_Padrao
					)
					Set @data  = (Select dateadd(DAY,1,@data ))
				end
				goto Inicio;
			end
		End
	-- Se nao encontrar Referencia do Ponto para o Mes Cria uma nova
		else
		begin
			Insert into	ponto
			values
			(
				@cdMatricula
				,month(@getdate)
				,DateAdd(mm, DateDiff(mm,1,@getdate), 0)
				,DateAdd(mm, DateDiff(mm,1,@getdate) +1,-1)
				,8
				,null
				,null
			)
			--select * from ponto
			--return
			goto Inicio;
		end
	End
	else
	begin
		Set @msg = 'Usuario não Cadastrado'
	end
	if @msg is not null
		Select @msg as msg	
End
			
			





	