
USE DPTec

GO

Create Table PerfilUsuario
(
    cd_Perfil Int Not Null
      ,Constraint FK_PerfilUser_Perfil Foreign Key (cd_Perfil) References Perfil (cd_Perfil) 
    ,cd_Usuario Int Not Null
      ,Constraint FK_PerfilUser_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario) 
    ,ic_Ativo Bit Not Null
      ,Constraint PK_PerfilUser Primary Key (cd_Perfil, cd_Usuario)
);
