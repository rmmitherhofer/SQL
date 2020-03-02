USE DPtec

GO

Create PROCEDURE sp_LogCestaProdutoFuncionario
(
	@cd_Cesta	  Int
    ,@cd_Usuario	   Int
    ,@tp_Operacao Char(1)
  )
As

Declare
		@cd_CestaProduto int
		,@cd_Produto int
		,@cd_Matricula int
		,@dt_Inclusao SmalldateTime
		,@ic_Ativo bit
		,@ds_Log Varchar(200)
		,@dt_Cadastro SmallDateTime		
		,@dt_Alteracao SmallDateTime			
		,@dt_Desativacao SmallDateTime
BEGIN 

    Select 
		@cd_CestaProduto = cd_CestaProduto
		,@cd_Produto = cd_Produto		
		,@cd_Matricula = cd_Matricula	
		,@dt_Inclusao = dt_Inclusao			
		,@ic_Ativo = ic_Ativo		      
      From CestaProdutoFuncionario
      Where 
          cd_CestaProduto = @cd_Cesta;
          
IF (@tp_Operacao != 'I')
	begin   
      Select top 1
		@dt_Cadastro = dt_Cadastro
      From
        LogCestaProdutoFuncionario
      where cd_CestaProduto = @cd_Cesta
            and tp_Operacao = 'I'
      order by dt_Cadastro desc;
	end

          
    IF (@tp_Operacao = 'I' or @tp_Operacao = 'i')
		begin 
			Set @ds_Log = 'Vinculo de Produto'
			Set @dt_Cadastro	= GetDate()
			Set @dt_Alteracao = null	
			Set @dt_Desativacao = null 
		end       
    else if (@tp_Operacao = 'U' or @tp_Operacao = 'u')
		Begin
			Set @ds_Log = 'Alteração Vinculo'
			Set @dt_Alteracao = GetDate()	
			Set @dt_Desativacao = null
		End
    else if (@tp_Operacao = 'D' or @tp_Operacao = 'd')
		Begin
			Set @ds_Log = 'Exclusão de Vinculo'
			Set @dt_Alteracao = GetDate()
			Set @dt_Desativacao = GetDate()
		End

    
 if @cd_CestaProduto is Not NULL 
	Begin 
		Insert Into LogCestaProdutoFuncionario
			(	
				cd_CestaProduto		
				,cd_Produto		
				,cd_Matricula		
				,dt_Inclusao			
				,ic_Ativo		
				,ds_Log
				,tp_Operacao
				,dt_Cadastro	
				,dt_Alteracao
				,dt_Desativacao	
				,cd_Usuario
			) 
			VALUES 
			(
				@cd_CestaProduto		
				,@cd_Produto		
				,@cd_Matricula		
				,@dt_Inclusao			
				,@ic_Ativo		
				,@ds_Log
				,@tp_Operacao	
				,@dt_Cadastro
				,@dt_Alteracao		
				,@dt_Desativacao	
				,@cd_Usuario
			);
	End	
End