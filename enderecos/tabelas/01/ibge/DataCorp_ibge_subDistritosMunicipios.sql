/*
* TABELA: [DataCorp].[ibge].[subDistritosMunicipios]
*/

USE DataCorp
GO

SET CONCAT_NULL_YIELDS_NULL OFF;
SET NOCOUNT ON ;

DECLARE @mensagem   varchar(100);
DECLARE @erro BIT = 0;

BEGIN TRY
  DECLARE @mensagemP1 varchar(100) = '<<< ';
  DECLARE @mensagemP2 varchar(100);
  DECLARE @mensagemP3 varchar(100);
  DECLARE @mensagemP4 varchar(100);

  SET @erro = 1
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunFkMun] >>>'
  IF OBJECT_ID('[ibge].[subDisMunFkMun]') IS NOT NULL
    ALTER TABLE [ibge].[subDistritosMunicipios]
      DROP CONSTRAINT [subDisMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunFkSubDis] >>>'
  IF OBJECT_ID('[ibge].[subDisMunFkSubDis]') IS NOT NULL
    ALTER TABLE [ibge].[subDistritosMunicipios]
      DROP CONSTRAINT [subDisMunFkSubDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[subDistritosMunicipios] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'subDistritosMunicipios' )
  BEGIN
    DROP TABLE [ibge].[subDistritosMunicipios]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[subDistritosMunicipios]
  (

    [subDisMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subDistritosMunicipiossubDisMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [subDistritosMunicipiosmunIdNn] NOT NULL

  , [subDisId]
      BIGINT
      CONSTRAINT [subDistritosMunicipiossubDisIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunPk] >>>'
  ALTER TABLE [ibge].[subDistritosMunicipios]
    ADD CONSTRAINT [subDisMunPk]
      PRIMARY KEY CLUSTERED
      (
        [subDisMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipios') AND name='subDisMunIxAk')
  BEGIN
    DROP INDEX [ibge].[subDistritosMunicipios].[subDisMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunIxAk] >>>'
  CREATE UNIQUE INDEX [subDisMunIxAk]
    ON [ibge].[subDistritosMunicipios]
    (
      [munId]
    , [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipios') AND name='subDisMunIxFkMun')
  BEGIN
    DROP INDEX [ibge].[subDistritosMunicipios].[subDisMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [subDisMunIxFkMun]
    ON [ibge].[subDistritosMunicipios]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunFkMun] >>>'
  ALTER TABLE [ibge].[subDistritosMunicipios]
    ADD CONSTRAINT [subDisMunFkMun]
    FOREIGN KEY
    (
      [munId]
    )
    REFERENCES [DataCorp].[ibge].[municipios]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunIxFkSubDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipios') AND name='subDisMunIxFkSubDis')
  BEGIN
    DROP INDEX [ibge].[subDistritosMunicipios].[subDisMunIxFkSubDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subDisMunIxFkSubDis]
    ON [ibge].[subDistritosMunicipios]
    (
      [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosMunicipios].[subDisMunFkSubDis] >>>'
  ALTER TABLE [ibge].[subDistritosMunicipios]
    ADD CONSTRAINT [subDisMunFkSubDis]
    FOREIGN KEY
    (
      [subDisId]
    )
    REFERENCES [DataCorp].[ibge].[subDistritos]
    (
      [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
