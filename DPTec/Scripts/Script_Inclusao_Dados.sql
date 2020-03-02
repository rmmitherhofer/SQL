--Create database DPTec
Use DPTec
-- Para cadastro da categoria das coisas
Insert Into Categoria
Values
(
	'Beneficio'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Beneficio Dependente'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Formação Escolar'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Categoria
Values
(
	'Experiencia Profissional'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Cursos'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Categoria
Values
(
	'Distribuição de Lucros'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Categoria
Values
(
	'Adiantamento Quinzenal'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Categoria
Values
(
	'Mensal'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Desconto'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Vencimentos'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Categoria
Values
(
	'Contribuição Obrigatória'		--,ds_Categoria Varchar (90) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

--select * from Categoria

-- Para cadastro da Status das coisas
Insert Into Status
Values
(
	'Ativo'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Inativo'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Bloqueado'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Férias'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Desligado'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Em Analise'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Pendente de Aprovação'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Em Aberto'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Fechado'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Concluido'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Incompleto'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

Insert Into Status
Values
(
	'Cursando'		--,ds_Status Varchar(22) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

-- Para cadastro de Endereço
Insert Into Endereco
Values
(
	'06420460'		 --   no_CEP numeric (8) Not Null
	,'Rua 25 de Janeiro'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Belval'		--,nm_Bairro Varchar (90) Not Null
	,'Barueri'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'04856090'		 --   no_CEP numeric (8) Not Null
	,'Rua Almirante Antônio Carlos Raja Gabaglia'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Myrna'		--,nm_Bairro Varchar (90) Not Null
	,'São Paulo'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'03436030'		 --   no_CEP numeric (8) Not Null
	,'Rua Antônio Carlos Brandão de Oliveira'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Vila Carrão'		--,nm_Bairro Varchar (90) Not Null
	,'São Paulo'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'08051390'		 --   no_CEP numeric (8) Not Null
	,'Rua Benedito Carlos Brunini'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Limoeiro'		--,nm_Bairro Varchar (90) Not Null
	,'São Paulo'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'03823180'		 --   no_CEP numeric (8) Not Null
	,'Rua Carlos Aguira'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Nova Tereza'		--,nm_Bairro Varchar (90) Not Null
	,'São Paulo'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'23065066'		 --   no_CEP numeric (8) Not Null
	,'Rua Prudente de Moraes'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Paciência'		--,nm_Bairro Varchar (90) Not Null
	,'Rio de Janeiro'		--,nm_Cidade Varchar (80) Not Null
	,'RJ'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'22795345'		 --   no_CEP numeric (8) Not Null
	,'Rua Prudente de Morais Neto'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Recreio dos Bandeirantes'		--,nm_Bairro Varchar (90) Not Null
	,'Rio de Janeiro'		--,nm_Cidade Varchar (80) Not Null
	,'RJ'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'66690824'		 --   no_CEP numeric (8) Not Null
	,'Rua Oito de Março'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Águas Lindas'		--,nm_Bairro Varchar (90) Not Null
	,'Belém'		--,nm_Cidade Varchar (80) Not Null
	,'PA'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'66123210'		 --   no_CEP numeric (8) Not Null
	,'Rua São Marcos'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Sacramenta'		--,nm_Bairro Varchar (90) Not Null
	,'Belém'		--,nm_Cidade Varchar (80) Not Null
	,'PA'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'69095660'		 --   no_CEP numeric (8) Not Null
	,'Rua Manoel Antônio de Souza'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Cidade Nova'		--,nm_Bairro Varchar (90) Not Null
	,'Manaus'		--,nm_Cidade Varchar (80) Not Null
	,'AM'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'69095253'		 --   no_CEP numeric (8) Not Null
	,'Rua Manoel Amazonas Botelho'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Cidade Nova'		--,nm_Bairro Varchar (90) Not Null
	,'Manaus'		--,nm_Cidade Varchar (80) Not Null
	,'AM'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'69027037'		 --   no_CEP numeric (8) Not Null
	,'Rua Manoel Querida'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'São Raimundo '		--,nm_Bairro Varchar (90) Not Null
	,'Manaus'		--,nm_Cidade Varchar (80) Not Null
	,'AM'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'81510370'		 --   no_CEP numeric (8) Not Null
	,'Rua Renato Baroni'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Guabirotuba'		--,nm_Bairro Varchar (90) Not Null
	,'Curitiba'		--,nm_Cidade Varchar (80) Not Null
	,'PR'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'81900650'		 --   no_CEP numeric (8) Not Null
	,'Rua Renato Wilczak'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Sítio Cercado'		--,nm_Bairro Varchar (90) Not Null
	,'Curitiba'		--,nm_Cidade Varchar (80) Not Null
	,'PR'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'81315190'		 --   no_CEP numeric (8) Not Null
	,'Rua São Gregório X'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Cidade Industrial '		--,nm_Bairro Varchar (90) Not Null
	,'Curitiba'		--,nm_Cidade Varchar (80) Not Null
	,'PR'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'11661730'		 --   no_CEP numeric (8) Not Null
	,'Rua Roberto Miguel David'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Vila Ponte Seca '		--,nm_Bairro Varchar (90) Not Null
	,'Caraguatatuba'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'11669296'		 --   no_CEP numeric (8) Not Null
	,'Rua Roberto Ramos das Mercês'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Loteamento Bosque dos Guanandis'		--,nm_Bairro Varchar (90) Not Null
	,'Caraguatatuba'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'11060310'		 --   no_CEP numeric (8) Not Null
	,'Rua Particular Santos Cruz'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Gonzaga'		--,nm_Bairro Varchar (90) Not Null
	,'Santos'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'11080440'		 --   no_CEP numeric (8) Not Null
	,'Rua José Hilário dos Santos'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Morro Nova Cintra'		--,nm_Bairro Varchar (90) Not Null
	,'Santos'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'11081415'		 --   no_CEP numeric (8) Not Null
	,'Rua Francisco José dos Santos'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Morro São Bento '		--,nm_Bairro Varchar (90) Not Null
	,'Santos'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06462270'		 --   no_CEP numeric (8) Not Null
	,'Rua José Henrique dos Santos'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Parque Imperial '		--,nm_Bairro Varchar (90) Not Null
	,'Barueri'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06420225'		 --   no_CEP numeric (8) Not Null
	,'Rua Castorino Pedro dos Santos'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Belval'		--,nm_Bairro Varchar (90) Not Null
	,'Barueri'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06420360'		 --   no_CEP numeric (8) Not Null
	,'Rua Santos Dumont'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Belval '		--,nm_Bairro Varchar (90) Not Null
	,'Barueri'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06654855'		 --   no_CEP numeric (8) Not Null
	,'Rua Eloizo Ferreira lopes'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Vale do Sol II '		--,nm_Bairro Varchar (90) Not Null
	,'Itapevi'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06695220'		 --   no_CEP numeric (8) Not Null
	,'Rua Claudionor Lopes'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Jardim Portela'		--,nm_Bairro Varchar (90) Not Null
	,'Itapevi'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06110090'		 --   no_CEP numeric (8) Not Null
	,'Rua Guia Lopes'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Centro '		--,nm_Bairro Varchar (90) Not Null
	,'Osasco'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06080240'		 --   no_CEP numeric (8) Not Null
	,'Rua Antônio Augusto Lopes'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Vila Osasco'		--,nm_Bairro Varchar (90) Not Null
	,'Osasco'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);
Insert Into Endereco
Values
(
	'06160128'		 --   no_CEP numeric (8) Not Null
	,'Rua Jaimes Pires Martins'	 --   ,nm_Logradouro Varchar (100) Not Null
	,'Bandeiras '		--,nm_Bairro Varchar (90) Not Null
	,'Osasco'		--,nm_Cidade Varchar (80) Not Null
	,'SP'	 --   ,sg_UF Char (2) Not Null
	,'Brasil'	 --   ,nm_Pais Varchar(60) Not Null
	,1	 --   ,ic_Ativo bit Not Null
);

-- Para cadastro de Estado Civil
Insert Into EstadoCivil
Values
(
	'Solteiro'			--,ds_EstadoCivil Varchar (20) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into EstadoCivil
Values
(
	'Casado'			--,ds_EstadoCivil Varchar (20) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into EstadoCivil
Values
(
	'Divorciado'			--,ds_EstadoCivil Varchar (20) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into EstadoCivil
Values
(
	'Separado'			--,ds_EstadoCivil Varchar (20) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into EstadoCivil
Values
(
	'Concubinato'			--,ds_EstadoCivil Varchar (20) Not Null
	,1			--,ic_Ativo bit Not Null
);
-- Para cadastro de Cargo

Insert Into Cargo
Values
(
	'Analista de Suporte a Sistemas JR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Suporte a Sistemas PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Suporte a Sistemas SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Recrutamento e Seleção Jr'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Recrutamento e Seleção PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Recrutamento e Seleção SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Departamento Pessoal Jr'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Departamento Pessoal PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Departamento Pessoal SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Administrativo JR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Administrativo PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Administrativo SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Financeiro JR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Financeiro PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista Financeiro SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de BackOffice JR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de BackOffice PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de BackOffice SR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Faturamento JR'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Faturamento PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);

Insert Into Cargo
Values
(
	'Analista de Faturamento PL'			--,ds_Cargo Varchar (60) Not Null
	,1			--,ic_Ativo bit Not Null
);


-- Para cadastro de Departamento
Insert Into Departamento
values
(
	'Suporte a Sistemas'			--,ds_Departamento Varchar (35) Not Null
	,'DA055975'			--,cd_CCusto Varchar(8) Not Null
	,NULL
	,1		 --   ,ic_Ativo bit Not Null
);

Insert Into Departamento
values
(
	'Sistemas'			--,ds_Departamento Varchar (35) Not Null
	,'DA05587'			--,cd_CCusto Varchar(8) Not Null
	,1
	,1		 --   ,ic_Ativo bit Not Null
);

Insert Into Departamento
values
(
	'Faturamento'			--,ds_Departamento Varchar (35) Not Null
	,'DA44654'			--,cd_CCusto Varchar(8) Not Null
	,NULL
	,1		 --   ,ic_Ativo bit Not Null
);

Insert Into Departamento
values
(
	'Financeiro'			--,ds_Departamento Varchar (35) Not Null
	,'DA98799'			--,cd_CCusto Varchar(8) Not Null
	,NULL
	,1		 --   ,ic_Ativo bit Not Null
);

Insert Into Departamento
values
(
	'BackOffice'			--,ds_Departamento Varchar (35) Not Null
	,'DA87899'			--,cd_CCusto Varchar(8) Not Null
	,NULL
	,1		 --   ,ic_Ativo bit Not Null
);

Insert Into Departamento
values
(
	'Credito e Cobrança'			--,ds_Departamento Varchar (35) Not Null
	,'DA988987'			--,cd_CCusto Varchar(8) Not Null
	,NULL
	,1		 --   ,ic_Ativo bit Not Null
);

-- Dados da Empresa
Insert Into Empresa
values
(
	'I15 Tecnologia'			--,nm_Fantasia varchar(100)not null
	,'I15 Teconologia Ltda'			--,nm_Razao_Social Varchar(100) not null
	,465798798798			--,no_CNPJ numeric (15) Unique not null
	,45648787			--,no_Insc_Estadual numeric (15) Unique not null
	,'Tecnologia'			--,nm_Segmento varchar(30) not null
	,'03/04/99 22:54:21'			--,ts_Abertura SmallDateTime not null
	,NULL			--,ts_Fechamento SmallDateTime null
	,1			--,cd_Status int 
				--	Constraint FK_Empresa_Status Foreign Key (cd_Status) References [Status] (cd_Status) Not Null
	,'i15tecnologia@i15.com.br'			--,nm_Site Varchar(120) not null
	,1			--,cd_Categoria int 
				--	Constraint FK_Empresa_Categoria Foreign Key (cd_Categoria) References Categoria (cd_Categoria) Not Null
	,'06420460'			--,no_CEP numeric(8)
				--	Constraint FK_Empresa_Endereco Foreign Key (no_CEP) References Endereco (no_CEP) Not Null 
	,'657'			--,no_Endereco NVarchar (6) not null
	,NULL			--,nm_Complemento varchar(60) null
	,1166888877			--,no_Telefone_SAC numeric(11) not null
	,1166687878			--,no_Telefone_Ouvidoria numeric(11) not null
	,'Brasil'			--,nm_Pais_Origem Varchar(15) not null
);
-- Para cadastro de Funcionarios
Insert Into Funcionario
values
(
	'Renato Matos dos Santos Mitherhofer'					--,nm_Funcionario Varchar (80) Not Null
	,1141988888					--,no_Telefone numeric(10) null
	,11960609797					--,no_TelCelular numeric(11) null
	,1132389999				 --   ,no_TelComercial numeric(10) null
	,9001				 --   ,no_Ramal numeric(4) null
	,'rmmitherhofer@teste.com.br'					--,ds_email Varchar(100) Null
	,'rmmitherhofer@I15.com.br'       --ds_emailCom Varchar(100) Null	
	,'Maria Jose da Silva Silveira'					--,nm_Mae Varchar (80)Not Null
	,'Jose da Silva Silveira'						--,nm_Pai Varchar (80) null
	,'Brasileiro'					--,ds_Nacionalidade Varchar(40) Not Null 
	,'Osasco'					--,ds_Naturalidade Varchar (50) Not Null
	,'1990-07-23'					--,dt_Nascimento date Not Null
	,'Masculino'					--,ic_Sexo Varchar (9)
	,2					--,cd_EstadoCivil int
	,'Pamela de Carvalho Mitherhofer'				--nm_Conjuge Varchar(80)Null
	,'Nenhuma'-- ,ds_NecesEspecial	Varchar(40) Not Null
	,0004417					--,no_CTPS numeric(8) unique Not Null
	,48797					--,no_Serie numeric(8) Not Null
	,'SP'					--,sg_UF_CTPS Char (2) Not Null
	,'2011-09-13'				--,dt_Expedicao date Not Null
	,'49879879879'					--,no_PIS numeric (13) unique Not Null
	,'476384552'					--,no_RG Varchar(11) unique Not Null
	,'SSP'                  --ds_OrgExp Varchar(4) Not Null
	,'2004-04-15'					--,dt_Expedicao_RG date Not Null
	,'39322244425'				--,no_CPF numeric (11) unique Not Null
	,'546548797999'					--,no_Tit_Eleitor numeric(15) unique Not Null
	,666					--,no_Zona int Not Null
	,999					--,no_Secao int Not Null
	,489879					--,no_Reservista numeric (6) Unique null
	,'54968798798'					--,no_RA_Reservista numeric (12) null
	,'A'					--,sg_Serie_Reservista Char (1) null
	,'2005-04-06 12:52:44'					--,ts_Admissao smalldatetime Not Null
	,NULL					--,ts_Desligamento smalldatetime null
	,1					--,cd_Cargo Int
	,1					--,cd_Departamento int
	,'CLT'      --tp_Contrato Varchar(12)Not Null
	,'06420460'					--,no_CEP numeric(8)
	,'123'					--,no_Endereco Varchar (6) not null
	,'Casa 2'					--,nm_Complemento varchar(60) null
	,1					--,cd_Status int
	,1
);


Insert Into Funcionario
values
(
	'Victor Augusto de Andrade Teixeira Monfardini'					--,nm_Funcionario Varchar (80) Not Null
	,1145787363				--,no_Telefone numeric(10) null
	,11925361534					--,no_TelCelular numeric(11) null
	,1128374528				 --   ,no_TelComercial numeric(10) null
	,4826				 --   ,no_Ramal numeric(4) null
	,'vmonfardini@teste.com.br'					--,ds_email Varchar(100) Null
	,'vmonfardini@I15.com.br'       --ds_emailCom Varchar(100) Null	
	,'Josefa dos Santos Aguiar Monfardini'					--,nm_Mae Varchar (80)Not Null
	,'Mauro Brito Monfardini'						--,nm_Pai Varchar (80) null
	,'Brasileiro'					--,ds_Nacionalidade Varchar(40) Not Null 
	,'São Paulo'					--,ds_Naturalidade Varchar (50) Not Null
	,'1992-11-14'					--,dt_Nascimento date Not Null
	,'Masculino'					--,ic_Sexo Varchar (9)
	,1					--,cd_EstadoCivil int
	,null				--nm_Conjuge Varchar(80)Null
	,'Nenhuma'-- ,ds_NecesEspecial	Varchar(40) Not Null
	,0003457					--,no_CTPS numeric(8) unique Not Null
	,43667					--,no_Serie numeric(8) Not Null
	,'SP'					--,sg_UF_CTPS Char (2) Not Null
	,'2011-09-13'				--,dt_Expedicao date Not Null
	,'49879879876'					--,no_PIS numeric (13) unique Not Null
	,'476384553'					--,no_RG Varchar(11) unique Not Null
	,'SSP'                  --ds_OrgExp Varchar(4) Not Null
	,'2004-04-15'					--,dt_Expedicao_RG date Not Null
	,'39322244426'				--,no_CPF numeric (11) unique Not Null
	,'546548797992'					--,no_Tit_Eleitor numeric(15) unique Not Null
	,456					--,no_Zona int Not Null
	,456					--,no_Secao int Not Null
	,489872				--,no_Reservista numeric (6) Unique null
	,'54968798791'					--,no_RA_Reservista numeric (12) null
	,'A'					--,sg_Serie_Reservista Char (1) null
	,'2005-04-06 12:52:44'					--,ts_Admissao smalldatetime Not Null
	,NULL					--,ts_Desligamento smalldatetime null
	,1					--,cd_Cargo Int
	,1					--,cd_Departamento int
	,'CLT'      --tp_Contrato Varchar(12)Not Null
	,'06160128'					--,no_CEP numeric(8)
	,'12'					--,no_Endereco Varchar (6) not null
	,null					--,nm_Complemento varchar(60) null
	,1					--,cd_Status int
	,1
);

Insert Into Funcionario
values
(
	'Lucas Henrique da Silva Cruz'					--,nm_Funcionario Varchar (80) Not Null
	,1134435567				--,no_Telefone numeric(10) null
	,11914444456					--,no_TelCelular numeric(11) null
	,1167789434				 --   ,no_TelComercial numeric(10) null
	,7544				 --   ,no_Ramal numeric(4) null
	,'lcruz@teste.com.br'					--,ds_email Varchar(100) Null
	,'lcruz@I15.com.br'       --ds_emailCom Varchar(100) Null	
	,'Creuza da Silva Cruz'					--,nm_Mae Varchar (80)Not Null
	,'José Bonifacio Cruz'						--,nm_Pai Varchar (80) null
	,'Brasileiro'					--,ds_Nacionalidade Varchar(40) Not Null 
	,'São Paulo'					--,ds_Naturalidade Varchar (50) Not Null
	,'1992-11-14'					--,dt_Nascimento date Not Null
	,'Masculino'					--,ic_Sexo Varchar (9)
	,1					--,cd_EstadoCivil int
	,null				--nm_Conjuge Varchar(80)Null
	,'Nenhuma'-- ,ds_NecesEspecial	Varchar(40) Not Null
	,0003435					--,no_CTPS numeric(8) unique Not Null
	,43623					--,no_Serie numeric(8) Not Null
	,'SP'					--,sg_UF_CTPS Char (2) Not Null
	,'2011-09-13'				--,dt_Expedicao date Not Null
	,'49879879345'					--,no_PIS numeric (13) unique Not Null
	,'476384975'					--,no_RG Varchar(11) unique Not Null
	,'SSP'                  --ds_OrgExp Varchar(4) Not Null
	,'2004-04-15'					--,dt_Expedicao_RG date Not Null
	,'39322244568'				--,no_CPF numeric (11) unique Not Null
	,'546548797875'					--,no_Tit_Eleitor numeric(15) unique Not Null
	,456					--,no_Zona int Not Null
	,456					--,no_Secao int Not Null
	,489123				--,no_Reservista numeric (6) Unique null
	,'54968798456'					--,no_RA_Reservista numeric (12) null
	,'A'					--,sg_Serie_Reservista Char (1) null
	,'2005-04-06 12:52:44'					--,ts_Admissao smalldatetime Not Null
	,NULL					--,ts_Desligamento smalldatetime null
	,1					--,cd_Cargo Int
	,1					--,cd_Departamento int
	,'CLT'      --tp_Contrato Varchar(12)Not Null
	,'03823180'					--,no_CEP numeric(8)
	,'546'					--,no_Endereco Varchar (6) not null
	,null					--,nm_Complemento varchar(60) null
	,1					--,cd_Status int
	,1
);

-- Para cadastro de Usuarios dos Sistemas
Insert Into Usuario
Values
(
	'Renato Matos dos Santos Mitherhofer'				--,nm_Usuario Varchar(80) Not Null
	,'renato'			 --   ,ds_Login Varchar (20) Not Null
	,'1234'			 --   ,ds_Senha Varchar (12) Not Null
	,1
	,1			 --   ,ic_Ativo bit Not Null
);

Insert Into Usuario
Values
(
	'Lucas Henrique da Silva Cruz'				--,nm_Usuario Varchar(80) Not Null
	,'lucas'			 --   ,ds_Login Varchar (20) Not Null
	,'1234'			 --   ,ds_Senha Varchar (12) Not Null
	,2
	,1			 --   ,ic_Ativo bit Not Null
);
Insert Into Usuario
Values
(
	'Victor Augusto de Andrade Teixeira Monfardini'				--,nm_Usuario Varchar(80) Not Null
	,'victor'			 --   ,ds_Login Varchar (20) Not Null
	,'1234'			 --   ,ds_Senha Varchar (12) Not Null
	,3
	,1			 --   ,ic_Ativo bit Not Null
);

Insert Into Usuario
Values
(
	'Master'				--,nm_Usuario Varchar(80) Not Null
	,'master'			 --   ,ds_Login Varchar (20) Not Null
	,'1234'			 --   ,ds_Senha Varchar (12) Not Null
	,null
	,1			 --   ,ic_Ativo bit Not Null
);

-- Para cadastro do Dependente do Funcionario
Insert Into Dependente
values
(
	1			--,cd_Matricula Int
	,'Kleber da Silva Salro'			--,nm_Dependente Varchar(80) Not Null
	,'Masculino'			--,ds_Sexo Varchar(9) Not Null
	,'Filho'			--,ds_Parentesco	Varchar(10) Not Null
	,'Brasileiro'			--,ds_Nacionalidade Varchar(40) Not Null
	,'1994-07-03'			--,dt_Nascimento	 Date Not Null
	,'Nenhuma'			--,cd_NecesEspecial	Varchar(40) Not Null
	,'Pamela de Carvalho Mitherhofer'			--,nm_Mae Varchar(80) Not Null
	,'65878844'		--,no_CPF Varchar(14) Unique Not Null
	,'45987987'			--,no_RG	Varchar(11) Unique Not Null
	,'SSP'			--,ds_OrgExp Varchar(4) Not Null
	,'1994-04-23'			--,dt_ExpRG	Date Not Null
	,1			--,cd_Status	Int
);

--select* from DadosCurricular

Insert Into DadosCurricular
values
(
  1       -- ,cd_Matricula Int Not Null
  ,3        --,cd_Categoria Int Not Null
  ,'Universidade Nove de Julho (UNINOVE)' -- local
  ,'Ensino Superior Analise e Desenvolvimento de Sistemas'        --,ds_Curricular Varchar(200) Not Null
  ,'2016-01-01'        --,dt_Inicio Date Not Null
  ,null       -- ,dt_Conclusao Date Null
  ,8       -- ,cd_Status Int Not Null
);
Insert Into DadosCurricular
values
(
  1       -- ,cd_Matricula Int Not Null
  ,4        --,cd_Categoria Int Not Null
  ,'Simpress S.A' -- local
  ,'Analista de Suporte a Sistemas PL'        --,ds_Curricular Varchar(200) Not Null
  ,'2013-10-01'        --,dt_Inicio Date Not Null
  ,null       -- ,dt_Conclusao Date Null
  ,1       -- ,cd_Status Int Not Null
);
Insert Into DadosCurricular
values
(
  1       -- ,cd_Matricula Int Not Null
  ,3        --,cd_Categoria Int Not Null
  ,'Instituto Tecnico de Barueri (ITB)' -- local
  ,'Tecnologia da Informação'        --,ds_Curricular Varchar(200) Not Null
  ,'2011-08-01'        --,dt_Inicio Date Not Null
  ,'2012-12-31'       -- ,dt_Conclusao Date Null
  ,10       -- ,cd_Status Int Not Null
);


-- Para cadastro das Competencias Ex: Ferias, Desconto em banco de Horas etc.
Insert Into Competencia
values
(
	'Horas Normais'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Total de Horas Extras'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Horas Diurnas Não Extraordinárias'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Crédito Banco de Horas'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Débito Banco de Horas'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Interválo Inferior ao Previsto'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Atraso'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Abono'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Falta Injustificada'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Apontamento Inconsistente'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Horas Extras 80%'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Horas Extras 100%'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Horas Extras 60%'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Saldo atual de Crédito'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);

Insert Into Competencia
values
(
	'Saldo atual de Crédito Gerencial'					--,ds_Competencia Varchar(60) Not Null
	,1					--,ic_Ativo Bit Not Null
);


-- Cria Lista de Perfis de Acesso aos Sistemas
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/FolhaPonto'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Holerite'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/MeuCadastro'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/MeuBeneficio'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Arquivo'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Comum'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Arquivo/Logoff'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Tecnico'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Funcionario'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Tecnico'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Funcionario/Cadastrar'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Admin'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Ferramentas'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Admin'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Ferramentas/FechaPonto'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Admin'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Ferramentas/FechaFolha'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Admin'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Produto'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);
Insert Into Perfil
Values
(
 'User Admin'   --,tp_Perfil Varchar(200) Not Null
 ,'Default/Menu/Produto/Cadastrar'   --,ds_Liberacao Varchar (200) Not Null
 ,'DPTec'   --,ds_Sistema Varchar(60) Not Null
 ,1   --,ic_Ativo bit Not Null
);



--delete from Perfil
--delete from PerfilUsuario
-- Vincula Os Perfis de Acesso ao Usuario de Sistema
Insert Into PerfilUsuario
values
(
	1			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	2			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	3			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	4			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	5			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	6			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	7			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	8			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	9			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	10			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	11			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	12			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	13			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	14			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	15			--,cd_Usuario Int
	,1
	,1			--,ic_Ativo bit Not Null
);


Insert Into PerfilUsuario
values
(
	1			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	2			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	3			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	4			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	5			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	6			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	7			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	8			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	9			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	10			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	11			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	12			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	13			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	14			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);
Insert Into PerfilUsuario
values
(
	15			--,cd_Usuario Int
	,2
	,1			--,ic_Ativo bit Not Null
);

--Dados De Bancos
Insert Into Banco
Values(1,'Banco do Brasil','BB','Federal','www.bb.com.br', 1
)


Insert Into Banco
Values(2,'Banco Central do Brasil','BACEN','Federal','www.bcb.gov.br', 1
)


Insert Into Banco
Values(3,'Banco da Amazônia','BASA','Federal','www.basa.com.br', 1
)


Insert Into Banco
Values(4,'Banco do Nordeste do Brasil','BNB','Federal','www.bnb.gov.br', 1
)


Insert Into Banco
Values(7,'Banco Nacional de Desenvolvimento Econômico e Social','BNDES','Federal','www.bndes.gov.br', 1
)


Insert Into Banco
Values(104,'Caixa Econômica Federal','CEF','Federal','www.caixa.gov.br', 1
)


Insert Into Banco
Values(46,'Banco Regional de Desenvolvimento do Extremo Sul','BRDE','Interestadual','www.brde.com.br', 1
)


Insert Into Banco
Values(5697,'BADESUL Desenvolvimento S.A. – Agência de Fomento/RS','BADESUL','Estadual','www.badesul.com.br', 1
)


Insert Into Banco
Values(465,'Banco de Desenvolvimento do Espírito Santo','BANDES','Estadual','www.bandes.com.br', 1
)


Insert Into Banco
Values(23,'Banco de Desenvolvimento de Minas Gerais','BDMG','Estadual','www.bdmg.mg.gov.br', 1
)


Insert Into Banco
Values(200,'Banco de Desenvolvimento do Paraná','BADEP','Estadual','www.badep.pr.gov.br', 1
)


Insert Into Banco
Values(70,'Banco de Brasília','BRB','Distrital','www.brb.com.br', 1
)


Insert Into Banco
Values(47,'Banco do Estado de Sergipe','Banese','Estadual','www.banese.com.br', 1
)


Insert Into Banco
Values(21,'Banco do Estado do Espírito Santo','Banestes','Estadual','www.banestes.com.br', 1
)


Insert Into Banco
Values(37,'Banco do Estado do Pará','Banpará','Estadual','www.banparanet.com.br', 1
)


Insert Into Banco
Values(41,'Banco do Estado do Rio Grande do Sul','Banrisul','Estadual','www.banrisul.com.br', 1
)


Insert Into Banco
Values(75,'Banco ABN Amro S.A.','ABN','Privado','www.abnamro.com.br', 1
)


Insert Into Banco
Values(25,'Banco Alfa','Alfa','Privado','www.alfanet.com.br', 1
)


Insert Into Banco
Values(719,'Banco Banif','Banif','Privado','www.bancobanif.com.br', 1
)


Insert Into Banco
Values(107,'Banco BBM','BBM','Privado','www.bancobbm.com.br', 1
)


Insert Into Banco
Values(318,'Banco BMG','BMG','Privado','www.bancobmg.com.br', 1
)


Insert Into Banco
Values(218,'Banco Bonsucesso','Bonsucesso','Privado','www.bancobonsucesso.com.br', 1
)


Insert Into Banco
Values(208,'Banco BTG Pactual','BTG','Privado','www.btgpactual.com.br', 1
)


Insert Into Banco
Values(263,'Banco Cacique','Cacique','Privado','www.bancocacique.com.br', 1
)


Insert Into Banco
Values(473,'Banco Caixa Geral - Brasil','BCG-Brasil','Privado','www.bcgbrasil.com.br', 1
)


Insert Into Banco
Values(745,'Banco Citibank','Citibank','Privado','www.citibank.com.br', 1
)


Insert Into Banco
Values(721,'Banco Credibel','Credibel','Privado','www.credibel.com.br', 1
)


Insert Into Banco
Values(505,'Banco Credit Suisse','','Privado','www.credit-suisse.com.br', 1
)


Insert Into Banco
Values(707,'Banco Daycoval','Daycoval','Privado','www.bancodaycoval.com.br', 1
)


Insert Into Banco
Values(265,'Banco Fator','Fator','Privado','www.bancofator.com.br', 1
)


Insert Into Banco
Values(224,'Banco Fibra','Fibra','Privado','www.bancofibra.com.br', 1
)


Insert Into Banco
Values(121,'Banco Gerador','Gerador','Privado','www.bancogerador.com.br', 1
)


Insert Into Banco
Values(612,'Banco Guanabara','Guanabara','Privado','www.bancoguanabara.com.br', 1
)


Insert Into Banco
Values(604,'Banco Industrial do Brasil','BI','Privado','www.bancoindustrial.com.br', 1
)


Insert Into Banco
Values(320,'Banco Industrial e Comercial','BICBANCO','Privado','www.bicbanco.com.br', 1
)


Insert Into Banco
Values(653,'Banco Indusval','BI&P','Privado','www.bip.b.br', 1
)


Insert Into Banco
Values(77,'Banco Intermedium','Intermedium','Privado','www.intermedium.com.br', 1
)


Insert Into Banco
Values(184,'Banco Itaú BBA','Itaú BBA','Privado','www.itaubba.com.br', 1
)


Insert Into Banco
Values(479,'Banco ItaúBank','ItaúBank','Privado','www.itaubank.com.br', 1
)


Insert Into Banco
Values(389,'Banco Mercantil do Brasil','BMB','Privado','www.mercantildobrasil.com.br', 1
)


Insert Into Banco
Values(746,'Banco Modal','Modal','Privado','www.modal.com.br', 1
)


Insert Into Banco
Values(738,'Banco Morada','Morada','Privado','www.bancomorada.com.br', 1
)


Insert Into Banco
Values(623,'Banco Pan','Pan','Privado','www.bancopan.com.br', 1
)


Insert Into Banco
Values(611,'Banco Paulista','Paulista','Privado','www.bancopaulista.com.br', 1
)


Insert Into Banco
Values(643,'Banco Pine','Pine','Privado','www.pine.com.br', 1
)


Insert Into Banco
Values(654,'Banco Renner','Renner','Privado','www.bancorenner.com.br', 1
)


Insert Into Banco
Values(741,'Banco Ribeirão Preto','BRP','Privado','www.brp.com.br', 1
)


Insert Into Banco
Values(422,'Banco Safra','Safra','Privado','www.safra.com.br', 1
)


Insert Into Banco
Values(33,'Banco Santander','Santander','Privado','www.santander.com.br', 1
)


Insert Into Banco
Values(637,'Banco Sofisa','Sofisa','Privado','www.sofisa.com.br', 1
)


Insert Into Banco
Values(82,'Banco Topázio','Topázio','Privado','www.bancotopazio.com.br', 1
)


Insert Into Banco
Values(655,'Banco Votorantim','BV','Privado','www.bancovotorantim.com.br', 1
)


Insert Into Banco
Values(237,'Bradesco','Bradesco','Privado','www.bradesco.com.br', 1
)


Insert Into Banco
Values(341,'Itaú Unibanco','Itaú','Privado','www.itau.com.br', 1
)


Insert Into Banco
Values(212,'Banco Original','Original','Privado','www.original.com.br/', 1
)


Insert Into Banco
Values(735 ,'Banco Neon','Neon','Privado','www.banconeon.com.br', 1
)


Insert Into Banco
Values(260,'Nu Pagamentos S.A','NuBank','Privado','nubank.com.br', 1
)


Insert Into Banco
Values(756,'Banco Cooperativo do Brasil - BANCOOB','BANCOOB','Cooperativo','www.bancoob.com.br', 1
)


Insert Into Banco
Values(748,'Banco Cooperativo Sicredi - BANSICREDI','SICREDI','Cooperativo','www.sicredi.com.br', 1
)

-- Dados das Contas Bancaria, Salarios, e Adicionais do Funcionario
Insert Into Financas
values
(
  'Conta Corrente'
	,184		--,ds_Banco Varchar(50) Not Null
	,4587			--,no_Agencia Numeric (16) Not Null
	,'4565498794'			--,no_Conta Numeric (18) Not Null
	,5  ---- Digito
	,1 --status
	,1			--,cd_Matricula Int
  ,3598.74 -- salario
);

Insert Into Financas
values
(
  'Conta Corrente'
	,184		--,ds_Banco Varchar(50) Not Null
	,4587			--,no_Agencia Numeric (16) Not Null
	,'4565498355'			--,no_Conta Numeric (18) Not Null
	,6  ---- Digito
	,1 --status
	,2			--,cd_Matricula Int
  ,2800.74 -- salario
);

Insert Into Financas
values
(
  'Conta Corrente'
	,184		--,ds_Banco Varchar(50) Not Null
	,4587			--,no_Agencia Numeric (16) Not Null
	,'4565498456'			--,no_Conta Numeric (18) Not Null
	,9  ---- Digito
	,1 --status
	,3			--,cd_Matricula Int
  ,1946.74 -- salario
);


-- Gera uma Cesta para Folha de Pagamento
--Insert Into Pagamento
--values
--(
--	1				--,cd_Empresa Int
--	,1				--,cd_Matricula Int
--	,1				--,cd_Financas Int
--	,'2017-09-30'				--,dt_Referencia Date Not Null
--	,'2017-09-28'				--,dt_Pagamento Date Not Null
--	,5548.66				--,vl_TotalVenidos Money Null
--	,687.66				--,vl_Descontos Money Null
--	,4958.65				--,vl_Liquidos Money Null
--);

-- Produtos como descontos e acrescimos, ex INSS, FGTS, Adicional Noturno
Insert Into Produto
values
(
	'Assist Odonto'				--,ds_produto Varchar(70)
	,12.25				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,1				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Assist. Odonto Dependente'				--,ds_produto Varchar(70)
	,14.50			--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,2			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'INSS'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,11				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Vale Transporte'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,0.06				--,pc_Produto Decimal(3,2)
	,1				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'IR Retido'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,10				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'Assist. Médica'				--,ds_produto Varchar(70)
	,23.39			--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,1			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Assist. Médica Dependente'				--,ds_produto Varchar(70)
	,35.39			--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,2			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Vale Alimentação'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL			--,pc_Produto Decimal(3,2)
	,1				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'Vale Restaurante'				--,ds_produto Varchar(70)
	,53				--,vl_Produto Money
	,null				--,pc_Produto Decimal(3,2)
	,1				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'Vale Combustivel'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,0.06				--,pc_Produto Decimal(3,2)
	,1				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Salario Base'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,8				--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Hora Extra 80%'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,1			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

Insert Into Produto
values
(
	'Hora Extra 60%'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,1			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'Adiant. Quinzenal'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,0.40				--,pc_Produto Decimal(3,2)
	,7			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);
Insert Into Produto
values
(
	'Desc Banco de Hrs'				--,ds_produto Varchar(70)
	,NULL				--,vl_Produto Money
	,NULL				--,pc_Produto Decimal(3,2)
	,9			--,cd_Categoria Int
	,1				--,ic_Ativo Bit
);

-- Gera uma Cesta de Beneficios que um Funcionario pode ter
Insert Into CestaProdutoFuncionario
values
(
	1				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	3				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	4				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	5				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	6				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	8				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	9				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	10				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	11				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	12				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	13				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoFuncionario
values
(
	14				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);

--select * from Produto

---- Gera uma Cesta de Beneficios que um Dependente pode ter
Insert Into CestaProdutoDependente
values
(
	2				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);
Insert Into CestaProdutoDependente
values
(
	7				--cd_Produto
	,1				--cd_Matricula
	,GETDATE()	--dt_Inclusao
	,1				--ic_Ativo
);

-- Cadastro das configurações Padrão de Sistemas, para definir quantidade de Horas trabalhadas por Semana Por Exemplo
--Insert Into Configuracoes
--(
--);

---- Gera Log Continuo de cada Acesso e Ação do usuario
--Insert Into LogAcesso
--(
--);

Insert into HorasVigente
	Values
		(
		'8:00'			--hr_Entrada
		,'12:00'			--hr_Saida_Almoco
		,'13:00'			--hr_Volta_Almoco
		,'18:00'			--hr_Saida
		,NULL			--ic_Semana
		,1			--ic_ativo
		)
Insert into HorasVigente
	Values
		(
		'8:00'			--hr_Entrada
		,'12:00'			--hr_Saida_Almoco
		,'13:00'			--hr_Volta_Almoco
		,'17:00'			--hr_Saida
		,6			--ic_Semana
		,1			--ic_ativo
		)

Insert into HorasVigente
	Values
		(
		NULL			--hr_Entrada
		,NULL			--hr_Saida_Almoco
		,NULL			--hr_Volta_Almoco
		,NULL			--hr_Saida
		,7			--ic_Semana
		,1			--ic_ativo
		)

Insert into HorasVigente
	Values
		(
					--	cd_HoraVigente
		NULL			--hr_Entrada
		,NULL			--hr_Saida_Almoco
		,NULL			--hr_Volta_Almoco
		,NULL			--hr_Saida
		,1			--ic_Semana
		,1			--ic_ativo
		)

