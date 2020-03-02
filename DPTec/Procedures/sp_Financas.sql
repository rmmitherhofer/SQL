USE DPtec

GO

Create PROCEDURE sp_Financas
(
	@cd_Financas Int
	,@tp_Conta Varchar(15)
	,@cd_Banco Int
	,@no_Agencia Numeric (16)
	,@no_Conta Numeric (18)
	,@no_Digito Int
	,@cd_Status Int
	,@cd_Matricula Int
	,@vl_Salario Decimal(10,2)
	,@Op Char(1)
	,@cd_Usuario Int
  )
As

BEGIN  
    IF (@Op = 'I')
		Begin
			Insert Into Financas
				(
					tp_Conta
					,cd_Banco
					,no_Agencia
					,no_Conta
					,no_Digito
					,cd_Status
					,cd_Matricula
					,vl_Salario			
				) 
				VALUES (
					@tp_Conta
					,@cd_Banco
					,@no_Agencia
					,@no_Conta
					,@no_Digito
					,@cd_Status
					,@cd_Matricula
					,@vl_Salario				
				);
		End
	IF (@Op = 'U')
	Begin
		Update Financas
		Set
			tp_Conta = @tp_Conta
			,cd_Banco = @cd_Banco
			,no_Digito = @no_Digito
			,cd_Status = @cd_Status
			,vl_Salario	= @vl_Salario
		where cd_Matricula = @cd_Matricula
				and no_Conta = @no_Conta
	end


	IF (@Op = 'D')
	Begin
		Update Financas
		Set
			cd_Status = 2
		where cd_Financas = @cd_Financas
	end
End

