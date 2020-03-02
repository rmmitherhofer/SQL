USE DPtec

GO

Create PROCEDURE sp_CestaProduto
(
	@cd_produto Int
	,@cd_Matricula Int
	,@cd_Dependente int
	,@tp CHAR(1)
	,@cdUsuario Int
	,@Op CHAR(1)
  )
As
declare 
	@msg Varchar(200)
	,@cdCestaProduto int

BEGIN
	
	if not exists (Select * from CestaProdutoFuncionario
						where cd_Matricula = @cd_Matricula
							and cd_Produto = @cd_produto)
	begin	  
		IF (@Op = 'I' and @tp = 'F')
		Begin
			Insert Into CestaProdutoFuncionario
				(
					cd_Produto
					,cd_Matricula
					,dt_Inclusao
					,ic_Ativo			
				) 
				VALUES (
					@cd_Produto
					,@cd_Matricula
					,GetDate()
					,1			
				);
			-- Busca Informações da Cesta de Produto para gerar LOG  
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
				end          
		End
	end


	if exists (Select * from CestaProdutoFuncionario
						where cd_Matricula = @cd_Matricula
							and cd_Produto = @cd_produto)
	begin
		IF (@Op = 'D' and @tp = 'F')
		begin
					-- Busca Informações da Cesta de Produto para gerar LOG  
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
				end   
			Delete from CestaProdutoFuncionario
				where cd_Produto = @cd_produto
					and cd_Matricula = @cd_Matricula

		end
	end


	--procedimento do Dependente	
	if not exists (Select * from CestaProdutoDependente
						where cd_Dependente = @cd_Dependente
							and cd_Produto = @cd_produto)
	begin
		IF (@Op = 'I' and @tp = 'D')
		Begin
			Insert Into CestaProdutoDependente
				(
					cd_Produto
					,cd_Dependente
					,dt_Inclusao
					,ic_Ativo			
				) 
				VALUES (
					@cd_Produto
					,@cd_Dependente
					,GetDate()
					,1			
				);
			-- Busca Informações da Cesta de Produto para gerar LOG  
			Select 
				  @cdCestaProduto = cd_CestaBeneficio
			  From CestaProdutoDependente
			  Where 
				 cd_Dependente = @cd_Dependente
				 and cd_Produto = @cd_produto
				
			if @cdCestaProduto is not Null
			begin
				--Inclusão de Log De Alteração
				exec sp_LogCestaProdutoDependente @cdCestaProduto
									,@cdUsuario
									,@Op
			end    
		End
	end

	if exists (Select * from CestaProdutoDependente
						where cd_Dependente = @cd_Dependente
							and cd_Produto = @cd_produto)
	begin
		IF (@Op = 'D' and @tp = 'D')
		begin
					-- Busca Informações da Cesta de Produto para gerar LOG  
			Select 
				  @cdCestaProduto = cd_CestaBeneficio
			  From CestaProdutoDependente
			  Where 
				 cd_Dependente = @cd_Dependente
				 and cd_Produto = @cd_produto
				
			if @cdCestaProduto is not Null
				begin
			 --Inclusão de Log De Alteração
					exec sp_LogCestaProdutoDependente @cdCestaProduto
										,@cdUsuario
										,@Op
				end   
			Delete from CestaProdutoDependente
				where cd_Produto = @cd_produto
					and cd_Dependente = @cd_Dependente

		end
	end
end
