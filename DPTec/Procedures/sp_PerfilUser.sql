USE DPtec

GO

Create PROCEDURE sp_PerfilUser
(
	@cd_perfil Int
	,@cd_Usuario Int
	--,@cdUsuario int
	,@Op CHAR(1)
  )
As
declare 
	@msg Varchar(200)
	,@cdperfiluser int
	,@cduser int

BEGIN
	if not exists (Select * from PerfilUsuario
						where cd_Perfil = @cd_perfil
							and cd_Usuario = @cd_Usuario)
	begin	  
		IF (@Op = 'I')
		Begin
			Insert Into PerfilUsuario
				(
					cd_Perfil
					,cd_Usuario
					,ic_Ativo			
				) 
				VALUES (
					@cd_perfil
					,@cd_Usuario
					,1			
				);
			-- Busca Informações da Cesta de Produto para gerar LOG  
			Select 
				  @cdperfiluser = cd_Perfil
				  ,@cduser = cd_Usuario
			  From PerfilUsuario
			  Where 
				 cd_Perfil = @cd_perfil
				 and cd_Usuario = @cd_Usuario
				
			/*if @cdperfiluser is not Null and @cduser is not null
				begin
			 --Inclusão de Log De Alteração
					exec sp_LogPerfilUsuario @cdperfiluser
										,@cduser
										,@cdUsuario
										,@Op
				end     */     
		End
	end
	else
	begin
		IF (@Op = 'D')
		begin
					-- Busca Informações da Cesta de Produto para gerar LOG  
			Select 
				  @cdperfiluser = cd_Perfil
				  ,@cduser = cd_Usuario
			  From PerfilUsuario
			  Where 
				 cd_Perfil = @cd_perfil
				 and cd_Usuario = @cd_Usuario
				
			/*if @cdperfiluser is not Null and @cduser is not null
				begin
			 --Inclusão de Log De Alteração
					exec sp_LogPerfilUsuario @cdperfiluser
										,@cduser
										,@cdUsuario
										,@Op
				end     */    
				  
			Delete from PerfilUsuario
				where cd_Perfil = @cd_perfil
					and cd_Usuario = @cd_Usuario

		end
	end
End
