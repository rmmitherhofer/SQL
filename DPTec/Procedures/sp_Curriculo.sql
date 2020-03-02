USE DPtec

GO

Create PROCEDURE sp_Curriculo
(
	@cdcurricular int
	,@cdmatricula Int
	,@cdcategoria int
	,@nmlocal Varchar(300)
	,@dsCurricular Varchar(200)
	,@dtInicio Varchar(20)
	,@dtConclusao Varchar(20)
	,@cdStatus Int
	,@Op CHAR(1)
	,@cduser int
  )
As

BEGIN  
    IF (@Op = 'I')
		Begin
			Insert Into DadosCurricular
				(
					cd_Matricula
					,cd_Categoria
					,nm_Local
					,ds_Curricular
					,dt_Inicio
					,dt_Conclusao
					,cd_Status				
				) 
				VALUES (
					@cdmatricula 
					,@cdcategoria 
					,@nmlocal
					,@dsCurricular
					,Convert(Date,@dtInicio, 105)
					,Convert(Date,@dtConclusao, 105)
					,@cdStatus 
				);
		End
		IF (@Op = 'U')
		Begin
			Update DadosCurricular
				Set
					nm_Local = @nmlocal
					,ds_Curricular = @dsCurricular
					,dt_Inicio = Convert(Date,@dtInicio, 105)
					,dt_Conclusao = Convert(Date,@dtConclusao, 105)
					,cd_Status = @cdStatus
			where cd_Curricular = @cdcurricular			
		End
End