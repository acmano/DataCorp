/*
* TABELA: [DataCorp].[ibge].[distritosMunicipios]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[distritosMunicipios].[disMunFkMun] >>>'
  IF OBJECT_ID('[ibge].[disMunFkMun]') IS NOT NULL
    ALTER TABLE [ibge].[distritosMunicipios]
      DROP CONSTRAINT [disMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[distritosMunicipios].[disMunFkDis] >>>'
  IF OBJECT_ID('[ibge].[disMunFkDis]') IS NOT NULL
    ALTER TABLE [ibge].[distritosMunicipios]
      DROP CONSTRAINT [disMunFkDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[distritosMunicipios] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'distritosMunicipios' )
  BEGIN
    DROP TABLE [ibge].[distritosMunicipios]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[distritosMunicipios]
  (

    [disMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [distritosMunicipiosdisMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [distritosMunicipiosmunIdNn] NOT NULL

  , [disId]
      BIGINT
      CONSTRAINT [distritosMunicipiosdisIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[distritosMunicipios].[disMunPk] >>>'
  ALTER TABLE [ibge].[distritosMunicipios]
    ADD CONSTRAINT [disMunPk]
      PRIMARY KEY CLUSTERED
      (
        [disMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[distritosMunicipios].[disMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipios') AND name='disMunIxAk')
  BEGIN
    DROP INDEX [ibge].[distritosMunicipios].[disMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[distritosMunicipios].[disMunIxAk] >>>'
  CREATE UNIQUE INDEX [disMunIxAk]
    ON [ibge].[distritosMunicipios]
    (
      [munId]
    , [disId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[distritosMunicipios].[disMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipios') AND name='disMunIxFkMun')
  BEGIN
    DROP INDEX [ibge].[distritosMunicipios].[disMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [disMunIxFkMun]
    ON [ibge].[distritosMunicipios]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[distritosMunicipios].[disMunFkMun] >>>'
  ALTER TABLE [ibge].[distritosMunicipios]
    ADD CONSTRAINT [disMunFkMun]
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
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[distritosMunicipios].[disMunIxFkDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipios') AND name='disMunIxFkDis')
  BEGIN
    DROP INDEX [ibge].[distritosMunicipios].[disMunIxFkDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [disMunIxFkDis]
    ON [ibge].[distritosMunicipios]
    (
      [disId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[distritosMunicipios].[disMunFkDis] >>>'
  ALTER TABLE [ibge].[distritosMunicipios]
    ADD CONSTRAINT [disMunFkDis]
    FOREIGN KEY
    (
      [disId]
    )
    REFERENCES [DataCorp].[ibge].[distritos]
    (
      [disId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
