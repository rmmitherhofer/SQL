USE DPtec

GO

create PROCEDURE sp_Endereco
(
	@nocep	Varchar(8)
	,@nmlogradouro	Varchar(10)
	,@nmbairro Varchar(90)
	,@nmcidade Varchar(80)
	,@sguf Char(2)
	,@nmpais Varchar(60)
	,@icativo Bit
	,@cdUsuario Int
	,@Op CHAR(1)
  )
As

BEGIN  
    IF (@Op = 'I')
		Begin
			Insert Into Endereco
				(
					no_CEP
					,nm_Logradouro		
					,nm_Bairro	
					,nm_Cidade			
					,sg_UF
					,nm_Pais	
					,ic_Ativo				
				) 
				VALUES (
					@nocep
					,@nmlogradouro		
					,@nmbairro	
					,@nmcidade			
					,@sguf	
					,@nmpais
					,@icativo			
				);
		End
End