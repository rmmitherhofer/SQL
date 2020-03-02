USE DPtec

GO

ALTER Procedure sp_CalculaFolha
(
	@cdMatricula Int 
)
as
Declare 
@SaldoReferencia Varchar(6)
,@Saldo Varchar(6)
,@msg Varchar(300)
,@Salario Numeric(10,2)
,@SalarioHora Numeric(10,2)
,@SalarioExtra Numeric(10,2)
,@cdEmpresa Int 
,@cdFinanca int
,@cdPagamento Int
,@cddetalhepag int
,@IR Numeric(10,2)
,@qtDedendente Int
,@INSS Numeric(10,2)
,@getdate Date

----Para Use em testes
--Declare @cdMatricula int
--Set @cdMatricula = 1

if @cdMatricula = 0
	set @cdMatricula = null


Set @getdate = Getdate()
--Verifica se Funcionario existe
Select
	@cdMatricula = f.cd_Matricula
	,@cdEmpresa = f.cd_Empresa
	,@cdFinanca = fn.cd_Financas
from Funcionario f
	inner join Financas fn on fn.cd_Matricula = f.cd_Matricula
	where f.cd_Matricula = @cdMatricula
	
if @getdate >= DateAdd(mm, DateDiff(mm,1,@getdate) +1,-19) and @getdate <= DateAdd(mm, DateDiff(mm,1,@getdate) +1,-17)
Begin
	Declare cr_Funcionario Cursor	For 
	Select distinct
		cd_Matricula
	From Funcionario where cd_Status = 1

	Declare
		@cd_Matricula Int
	Open cr_Funcionario
	Fetch Next from cr_Funcionario into @cd_Matricula

	WHILE @@FETCH_STATUS = 0
	Begin
		-- Cria Tabela para começar a montar o detalhamento da Folha		
		IF OBJECT_ID('tempdb..#DetalAdiantamento') IS NOT NULL    
				 DROP TABLE #DetalAdiantamento
		Create Table #DetalAdiantamento
		(
			cdMatricula int
			,cdProduto Int
			,dsProduto Varchar(60)
			,Quant Numeric(10,2)
			,vlVencimento decimal(10,2)
			,vlDesconto decimal(10,2)
		)		
		Select
			@Salario = f.vl_Salario
		from Financas f
		Where f.cd_Matricula = @cd_Matricula
			and f.cd_Status = 1
		
		--Gerar Folha de Pagamento Quizenal
		Insert Into #DetalAdiantamento
		Select
			@cdMatricula 
			,cf.cd_Produto
			,p.ds_produto
			,Null
			,@Salario * pc_Produto
			,null
		from CestaProdutoFuncionario cf
			inner join Produto p on p.cd_Produto = cf.cd_Produto
		where cf.cd_Matricula = @cd_Matricula
								and cf.ic_Ativo = 1
								and p.cd_Produto = 14
								and p.pc_Produto is not null
		
		ConsultaPagamentoQuinzenal:

		Select 
			@cdPagamento = p.cd_Pagamento
			,@cddetalhepag = dp.cd_Pagamento		
		from Pagamento p
			left join DetalhePagamento dp on dp.cd_Pagamento = p.cd_Pagamento
		where month(dt_Pagamento) = month(@getdate)
			and cd_Matricula = @cd_Matricula
			and cd_Categoria = 7

		If @cdPagamento is not null
		begin
			if @cddetalhepag is null
			begin
				Insert Into DetalhePagamento
				Select 
				@cdPagamento
				,cdProduto
				,Quant
				,vlVencimento
				,vlDesconto
				from #DetalAdiantamento
				Close cr_Funcionario
				Deallocate cr_Funcionario
				return
			end
			else
			begin
				Close cr_Funcionario
				Deallocate cr_Funcionario
				return
			end
		End
		Else
		Begin
			Insert Into Pagamento
			Select
				@cdEmpresa	--cd_Empresa
				,@cdMatricula	--cd_Matricula
				,@cdFinanca	--cd_Financas
				,7 --Quinzenal --cdCAtegoria
				,DateAdd(mm, DateDiff(mm,1,@getdate) +1,-1)--dt_Referencia
				,@getdate --dt_Pagamento
				,sum(vlVencimento)--vl_TotalVencidos
				,0.0--vl_Descontos
				,sum(vlVencimento) --vl_Liquidos	
			from #DetalAdiantamento
			GOTO ConsultaPagamentoQuinzenal
		End	
		Fetch next from cr_Funcionario into @cd_Matricula				
	End
	Close cr_Funcionario
	Deallocate cr_Funcionario
End

--Inicia Procedimento para Gerar Folha de Pagamento Mensal
-- Cria Tabela para começar a montar o detalhamento da Folha		
IF OBJECT_ID('tempdb..#DetalFolha') IS NOT NULL    
		 DROP TABLE #DetalFolha
Create Table #DetalFolha
(
	cdMatricula int
	,cdProduto Int
	,dsProduto Varchar(60)
	,Quant Numeric(10,2)
	,vlVencimento decimal(10,2)
	,vlDesconto decimal(10,2)
)

--Gera Folha de Pagamento Mensal
If @cdMatricula is not null
Begin	
	if @getdate > DateAdd(mm, DateDiff(mm,1,@getdate) +1,-10) and @getdate < DateAdd(mm, DateDiff(mm,1,@getdate) +1,-1)
	begin
		--Verifica o Ponto do Mes anterior
		Select 
			@SaldoReferencia = hr_Saldo_Referencia
			,@Saldo = hr_Saldo
		from Ponto
			where ds_mes = month(@getdate) -1
					and cd_Status = 9

		IF @Saldo is not null and @SaldoReferencia is not null
		begin
			Set @Saldo = replace(@Saldo, ':', '.')
			Set @SaldoReferencia = replace(@SaldoReferencia, ':', '.')
		End
		Else 
		begin
			Set @msg = 'Não é Possivel efetuar o Fechamento pois o Ponto referente ao mes ' + Convert(Varchar(30),month(@getdate)-1) + ' Não esta Fechado!'
			Select @msg as msg
			Return
		End

		--Select 'Variaveis', @Saldo as Saldo, @SaldoReferencia as SaldoReferencia
		-- Levantamento dos valores para Vencimento
		--Inclusao do Salario Base 
		Insert Into #DetalFolha
		Select
			@cdMatricula
			,11
			,'Salario Base'
			,220
			,f.vl_Salario
			,Null
		from Financas f
			inner join Status s on s.cd_Status = f.cd_Status
		Where f.cd_Matricula = @cdMatricula
				and f.cd_Status = 1

		Select
			@Salario = f.vl_Salario
		from Financas f
		Where f.cd_Matricula = @cdMatricula
				and f.cd_Status = 1

		-- Calculo para retornar o valor da Hora Trabalhada.
		Set @SalarioHora = @Salario / 220

		--Select * from #DetalFolha

		If cast(@Saldo as numeric(10,2)) > 0.0
		begin
			--Inclusao de Hora extra se Houver
			Insert Into #DetalFolha
			Select 
				@cdMatricula 
				,cd_Produto
				,ds_Produto
				,@Saldo
				,(@SalarioHora * @Saldo) * 1.80	
				,null
			From Produto
				Where cd_Produto = 12
		End

		If cast(@Saldo as numeric(10,2)) < 0.0
		begin
			--Inclusao de Desconto se Houver
			Insert Into #DetalFolha
			Select 
				@cdMatricula 
				,cd_Produto
				,ds_Produto
				,replace(@Saldo,'-','')
				,(@SalarioHora * @Saldo)
				,null
			From Produto
				Where cd_Produto = 15
		End
	
		--Select * from Produto
		--Levantamento dos Valores para Desconto
		-- Levantamento dos Descontos que são calculados em cima do salario do Funcionario
		Insert Into #DetalFolha
		Select
			@cdMatricula 
			,cf.cd_Produto
			,p.ds_produto
			,Null
			,NULL
			,@Salario * pc_Produto
		from CestaProdutoFuncionario cf
			inner join Produto p on p.cd_Produto = cf.cd_Produto
		where cf.cd_Matricula = @cdMatricula
				and cf.ic_Ativo = 1
				and p.pc_Produto is not null

		-- Levantamento dos Descontos Com Valores Fixos
		Insert Into #DetalFolha
		Select
			@cdMatricula
			,cf.cd_Produto	
			,p.ds_produto
			,Null
			,NULL
			,vl_Produto	
		from CestaProdutoFuncionario cf
			inner join Produto p on p.cd_Produto = cf.cd_Produto
		where cf.cd_Matricula = @cdMatricula
				and cf.ic_Ativo = 1
				and p.vl_Produto is not null

		--Inclusao de Descontos caso Funcionario tenha Dependente Vinculado a algum Produto
		Insert Into #DetalFolha
		Select
			@cdMatricula 
			,cd.cd_Produto	
			,p.ds_produto
			,NULL
			,NULL
			,vl_Produto	
		from CestaProdutoDependente cd
			inner join Produto p on p.cd_Produto = cd.cd_Produto
			inner join Dependente D on cd.cd_Dependente = d.cd_Dependente
			inner join Categoria c on c.cd_Categoria = p.cd_Categoria
		where d.cd_Matricula = @cdMatricula
				and cd.ic_Ativo = 1

		--Calculo de INSS		
		IF @Salario <= 1659.38
			Set @INSS = @Salario * 0.08
		else if @Salario > 1659.38 and @Salario <= 2765.66
			Set @INSS = @Salario * 0.09
		else if @Salario > 2765.66 and @Salario <= 5531.31
			Set @INSS = @Salario * 0.11
		Else
			Set @INSS = 5531.31

		Insert Into #DetalFolha	
		Select 
			@cdMatricula
			,cd_Produto
			,ds_Produto
			,NULL
			,NULL	
			,@INSS
		From Produto
			Where cd_Produto = 3

		--Calculo do Imposto de Renda
		IF @Salario <= 1903.98
			Set @IR = 0
		else if @Salario > 1903.98 and @Salario <= 2826.65
			Set @IR = (@Salario * 0.075) / 13
		else if @Salario > 2826.65 and @Salario <= 3751.05
			Set @IR =  (@Salario * 0.15) / 13

		else if @Salario > 3751.05 and @Salario <= 4664.68
			Set @IR = (@Salario * 0.225) / 13
		else 
			Set @IR = (@Salario * 0.275) / 13

		--Calculo da Dedução por Dependente de Renda
		Select
			@qtDedendente = Count(*)
		from Dependente
			where cd_Matricula = @cdMatricula
			and  (Year(GETDATE()) - year(dt_Nascimento)) < 19
			Set @IR = @IR - (@qtDedendente * 189.59) / 13
			If @IR < 0
				Set @IR = 0		

		IF @Salario > 1903.98
		Insert Into #DetalFolha	
		Select 
			@cdMatricula
			,cd_Produto
			,ds_Produto
			,NULL
			,NULL
			,@IR
		From Produto
			Where cd_Produto = 5


		ConsultaPagamentoMensal:

		Select 
			@cdPagamento = p.cd_Pagamento
			,@cddetalhepag = dp.cd_Pagamento		
		from Pagamento p
			left join DetalhePagamento dp on dp.cd_Pagamento = p.cd_Pagamento
		where month(dt_Pagamento) = month(@getdate)
			and cd_Matricula = @cdMatricula
			and cd_Categoria = 8

		If @cdPagamento is not null
		begin
			if @cddetalhepag is null
			begin
				Insert Into DetalhePagamento
				Select 
					@cdPagamento
					,cdProduto
					,Quant
					,vlVencimento
					,vlDesconto
				from #DetalFolha
				set @msg = 'Fechamento Mensal efetuado com sucesso!'
				Select @msg as msg
				return
			end
			else
			begin
				set	@msg = 'Folha de Pagamento Mensal Ja foi gerada!'
				select @msg as msg
				return
			End
		End
		else
		begin
			Insert Into Pagamento
			Select
				@cdEmpresa	--cd_Empresa
				,@cdMatricula	--cd_Matricula
				,@cdFinanca	--cd_Financas
				,8 --Mensal --cdCAtegoria
				,DateAdd(mm, DateDiff(mm,1,@getdate) +1,-1)--dt_Referencia
				,@getdate --dt_Pagamento
				,sum(vlVencimento)--vl_TotalVencidos
				,sum(vldesconto)--vl_Descontos
				,sum(vlVencimento) - sum(vldesconto)--vl_Liquidos	
			from #DetalFolha
			GOTO ConsultaPagamentoMensal
		End
	End
	Else
	Begin
		Set @msg = 'O Fechamento da Folha é do dia 22 até o dia 30/31'
		select @msg as msg
		return
	End
End
Else
Begin
	Set @msg = 'Funcionario não cadastrado'
	select @msg as msg
	return
End