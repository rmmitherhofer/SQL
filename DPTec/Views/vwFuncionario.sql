USE DPtec

GO

Create view  vwConsultaFuncionario
as 
Select Distinct
  F.cd_Matricula as Func_cd_Matricula
  ,F.nm_Funcionario as Func_nm_Funcionario
  ,F.no_Telefone as Func_cno_Telefone
  ,F.no_TelCelular as Func_no_TelCelular
  ,F.no_TelComercial as Func_no_TelComercial
  ,F.no_Ramal as Func_no_Ramal
  ,F.ds_email as Func_ds_email
  ,F.ds_emailCom as Func_ds_emailCom
  ,F.nm_Mae as Func_nm_Mae
  ,F.nm_Pai as Func_nm_Pai
  ,F.ds_Nacionalidade as Func_ds_Nacionalidade
  ,F.ds_Naturalidade as Func_ds_Naturalidade
  ,convert(varchar(20),F.dt_Nascimento,103) as Func_dt_Nascimento
  ,F.ds_Sexo as Func_ds_Sexo
  ,F.cd_EstadoCivil as Func_cd_EstadoCivil
  ,EC.DS_ESTADOCIVIL as EstCivil_DS_ESTADOCIVIL
  ,F.nm_Conjuge as Func_nm_Conjuge
  ,F.ds_NecesEspecial as Func_ds_NecesEspecial
  ,F.no_CTPS as Func_no_CTPS
  ,F.no_Serie as Func_no_Serie
  ,F.sg_UF_CTPS as Func_sg_UF_CTPS
  ,convert(varchar(20),F.dt_Expedicao,103) as Func_dt_Expedicao
  ,F.no_PIS as Func_no_PIS
  ,F.no_RG as Func_no_RG
  ,F.ds_OrgExp as Func_ds_OrgExp
  ,convert(varchar(20),F.dt_Expedicao_RG,103) as Func_dt_Expedicao_RG
  ,F.no_CPF as Func_no_CPF
  ,F.no_Tit_Eleitor as Func_no_Tit_Eleitor
  ,F.no_Zona as Func_no_Zona
  ,F.no_Secao as Func_no_Secao
  ,F.no_Reservista as Func_no_Reservista
  ,F.no_RA_Reservista as Func_no_RA_Reservista
  ,F.sg_Serie_Reservista as Func_sg_Serie_Reservista
  ,convert(varchar(20),F.ts_Admissao,103) as Func_ts_Admissao
  ,convert(varchar(20),F.ts_Desligamento,103) as Func_ts_Desligamento
  ,F.cd_Cargo as Func_cd_Cargo
  ,C.DS_CARGO as Carg_DS_CARGO
  ,F.cd_Departamento as Func_cd_Departamento
  ,D.DS_DEPARTAMENTO as Dep_DS_DEPARTAMENTO
  ,D.CD_CCUSTO as Dep_CD_CCUSTO
  ,D.CD_MATRICULA as Dep_CD_MATRICULA
  ,FG.NM_FUNCIONARIO as Gest_NM_FUNCIONARIO
  ,CFG.DS_CARGO as Carg_Gestor
  ,F.tp_Contrato as Func_tp_Contrato
  ,F.no_CEP as Func_no_CEP
  ,E.NM_LOGRADOURO as End_NM_LOGRADOURO
  ,F.no_Endereco as Func_no_Endereco
  ,F.nm_Complemento as Func_nm_Complemento
  ,E.NM_BAIRRO as End_NM_BAIRRO
  ,E.NM_CIDADE as End_NM_CIDADE
  ,E.SG_UF as End_SG_UF
  ,E.NM_PAIS as End_NM_PAIS
  ,F.cd_Status as Func_cd_Status
  ,S.DS_STATUS as Stat_DS_STATUS
  ,emp.nm_Razao_Social as emp_Empresa
from Funcionario F
  INNER JOIN ESTADOCIVIL EC ON EC.CD_ESTADOCIVIL = F.CD_ESTADOCIVIL
  INNER JOIN CARGO C ON C.CD_CARGO = F.CD_CARGO
  INNER JOIN DEPARTAMENTO D ON D.CD_DEPARTAMENTO = F.CD_DEPARTAMENTO
  left JOIN FUNCIONARIO FG ON FG.CD_MATRICULA = D.CD_MATRICULA
  left JOIN CARGO CFG ON CFG.CD_CARGO = FG.CD_CARGO
  INNER JOIN ENDERECO E ON E.NO_CEP = F.NO_CEP
  INNER JOIN STATUS S ON S.CD_STATUS = F.CD_STATUS
  inner join Empresa emp on emp.cd_Empresa = f.cd_Empresa

