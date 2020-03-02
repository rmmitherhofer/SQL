USE DPtec

GO

create PROCEDURE sp_Produto
(
	@cd_produto Int
	,@ds_produto Varchar(70)
	,@vl_Produto Decimal(10,2)
	,@pc_Produto Decimal(3,2)
	,@cd_Categoria int
	,@ic_Ativo bit
	,@cdUsuario Int
	,@Op CHAR(1)
  )
As
declare 
	@msg Varchar(200)
	,@cdproduto int

BEGIN
	
	if not exists (Select * from Produto
						where cd_Produto = @cd_produto)
	begin	  
		IF (@Op = 'I')
		Begin
			Insert Into Produto
				(
					ds_produto
					,vl_Produto
					,pc_Produto
					,cd_Categoria
					,ic_Ativo			
				) 
				VALUES (
					@ds_produto
					,@vl_Produto
					,@pc_Produto
					,@cd_Categoria
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


	if exists (Select * from Produto
						where cd_Produto = @cd_produto)
	begin
		IF (@Op = 'U')
		begin
 
			Update Produto
			set ds_produto = @ds_produto
				,vl_Produto = @vl_Produto
				,pc_Produto = @pc_Produto
				,cd_Categoria = @cd_Categoria
				,ic_Ativo = @ic_Ativo
			where cd_Produto = @cd_produto
		end
	end
end
