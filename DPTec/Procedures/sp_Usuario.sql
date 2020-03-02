USE DPtec

GO

Create PROCEDURE sp_Usuario
(
	@cd_Usuario Int
	,@nm_Usuario Varchar(80)
	,@ds_Login Varchar(20)
	,@ds_Senha Varchar(12)
	,@cd_Matricula int
	,@ic_Ativo bit
	,@Op CHAR(1)
  )
As
declare 
	@msg Varchar(200)
	,@cdUsuario int

BEGIN
	
	if not exists (Select * from Usuario
						where cd_Usuario = @cd_Usuario)
	begin	  
		IF (@Op = 'I')
		Begin
			Insert Into Usuario
				(
					nm_Usuario
					,ds_Login
					,ds_Senha
					,cd_Matricula
					,ic_Ativo			
				) 
				VALUES (
					@nm_Usuario
					,@ds_Login
					,@ds_Senha
					,@cd_Matricula
					,@ic_Ativo			
				);
			/*-- Busca Informações da Cesta de Produto para gerar LOG  
			Select 
				  @cdCestaProduto = cd_CestaProduto
			  From CestaProdutoFuncionario
			  Where 
				 cd_Matricula = @cd_Matricula
				 and cd_Produto = @cd_produto
				
			if @cdCestaProduto is not Null
				begin
			 --Inclusão de Log De Alteração
					exec sp_LogCestaProdutoFuncionario @cdCestaProduto
										,@cdUsuario
										,@Op
				end      */    
		End
	end
	Else
	begin
		IF (@Op = 'U')
		begin 
			Update Usuario
			set nm_Usuario = @nm_Usuario
				,ds_Login = @ds_Login
				,ds_Senha = @ds_Senha
				,cd_Matricula = @cd_Matricula
				,ic_Ativo = @ic_Ativo
			where cd_Usuario = @cd_Usuario
		end
	end
end
