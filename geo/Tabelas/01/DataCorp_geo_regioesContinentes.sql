
--  mestreTabelaPrefixo           = ctn
--  mestreTabelaPrefixoMaiuscula  = Ctn
--  mestreTabelaNomeSingular      = continente
--  mestreTabelaChave             = ctnId
--  mestreTabelaChaveAk           = continenteNome
--  mestreFuncaoExiste            = continenteExiste
--  mestreFuncaoId                = continenteId
--  detalheTabelaPrefixo          = reg
--  detalheTabelaPrefixoMaiuscula = Reg
--  detalheTabelaNomeSingular     = regiao
--  detalheTabelaChave            = regId
--  detalheTabelaChaveAk          = regiaoNome
--  detalheFuncaoExiste           = regiaoExiste
--  detalheFuncaoId               = regiaoId
--  novaTabelaNomeSingular        = regiaoContinente
--  novaTabelaPk                  = regCtn
--  novaTabelaPkNome              = regCtnPk
--  novaTabelaChave               = regCtnId
--  novaTabelaChaveMaiuscula      = RegCtnId
--  novaTabelaNomePrefixo         = regCtn
--  novaTabelaIxAkNome            = regCtnIxAk
--  novaTabelaIxFkMestreNome      = regCtnIxFkCtn
--  novaTabelaFkMestreNome        = regCtnFkCtn
--  novaTabelaIxFkDetalheNome     = regCtnIxFk
--  novaTabelaFkDetalheNome       = regCtnFk
--  novaTabelaFuncaoInclui        = regiaoContinenteInclui

/*
* TABELA: [DataCorp].[geo].[regioesContinentes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regCtnFkCtn] >>>'
  IF OBJECT_ID('[geo].[regCtnFkCtn]') IS NOT NULL
    ALTER TABLE [geo].[regioesContinentes]
      DROP CONSTRAINT [regCtnFkCtn]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regCtnFk] >>>'
  IF OBJECT_ID('[geo].[regCtnFk]') IS NOT NULL
    ALTER TABLE [geo].[regioesContinentes]
      DROP CONSTRAINT [regCtnFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[regioesContinentes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'regioesContinentes' )
  BEGIN
    DROP TABLE [geo].[regioesContinentes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[regioesContinentes]
  (

    [regCtnId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesContinentesRegCtnIdNn] NOT NULL

  , [ctnId]
      BIGINT
      CONSTRAINT [regioesContinentesCtnIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [regioesContinentesRegIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[regioesContinentes].[regCtnPk] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regCtnPk]
      PRIMARY KEY CLUSTERED
      (
        [regCtnId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regCtnIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxAk')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regCtnIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regCtnIxAk] >>>'
  CREATE UNIQUE INDEX [regCtnIxAk]
    ON [geo].[regioesContinentes]
    (
      [ctnId]
    , [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regCtnIxFkCtn] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxFkCtn')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regCtnIxFkCtn]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [regCtnIxFkCtn]
    ON [geo].[regioesContinentes]
    (
      [ctnId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regCtnFkCtn] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regCtnFkCtn]
    FOREIGN KEY
    (
      [ctnId]
    )
    REFERENCES [DataCorp].[geo].[continentes]
    (
      [ctnId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regCtnIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxFk')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regCtnIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [regCtnIxFk]
    ON [geo].[regioesContinentes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[regiaoContinenteExiste]      >>>'
  IF OBJECT_ID('[geo].[regiaoContinenteExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[regiaoContinenteExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[regiaoContinenteExiste]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT = 0 ;
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @existe = 1
          FROM       [DataCorp].[geo].[continentes] mestre
          INNER JOIN [DataCorp].[geo].[regioesContinentes] nova
            ON  nova.ctnId = mestre.ctnId
          INNER JOIN [DataCorp].[geo].[regioes] detalhe
            ON  detalhe.regId = nova.regId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.nome = @detalheNome
      END
      IF  @existe != 1
      OR  @existe IS NULL
      BEGIN
        SET @existe = 0
      END
      RETURN @existe
    END
  ')

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[regiaoContinenteId]          >>>'
  IF OBJECT_ID('[geo].[regiaoContinenteId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[regiaoContinenteId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[regiaoContinenteId]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF  @mestreNome IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @ID = nova.regCtnId
          FROM       [DataCorp].[geo].[continentes] mestre
          INNER JOIN [DataCorp].[geo].[regioesContinentes] nova
            ON  nova.ctnId = mestre.ctnId
          INNER JOIN [DataCorp].[geo].[regioes] detalhe
            ON  detalhe.regId = nova.regId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.nome = @detalheNome
        IF @Id IS NULL
          SET @Id = 0
      END
      RETURN @Id
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regCtnFk] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regCtnFk]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[geo].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[regiaoContinenteInclui]      >>>'
  IF OBJECT_ID('[geo].[regiaoContinenteInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[regiaoContinenteInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[regiaoContinenteInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @ctnId  INTEGER
      DECLARE @regId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[continenteExiste] ( @mestreNome ) não existe!''
          IF  [geo].[continenteExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[continenteId] ( @mestreNome ) não encontrado!''
            SET @ctnId = [geo].[continenteId] ( @mestreNome )
            IF  @ctnId != 0
            BEGIN
              SET @erroNumero = 3
              SET @mensagem = ''Execução: [geo].[regiaoExiste] ( @detalheNome ) não existe!''
              IF  [geo].[regiaoExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[regiaoId] ( @detalheNome ) não encontrado!''
                SET @regId = [geo].[regiaoId] ( @detalheNome )
                IF  @regId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[regiaoContinenteExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[regiaoContinenteExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[regioesContinentes] VALUES ( @ctnId , @regId )''
                    INSERT
                      INTO  [geo].[regioesContinentes]
                      (
                        ctnId
                      , regId
                      )
                      VALUES
                      (
                        @ctnId
                      , @regId
                      )
                    SET @erroNumero = 0
                  END
                  ELSE
                    SET @erroNumero = 0
                END
                ELSE
                  SET @erroNumero = 0
              END
              ELSE
                SET @erroNumero = 0
            END
            ELSE
              SET @erroNumero = 0
          END
          ELSE
            SET @erroNumero = 0
          IF  @erroNumero!=0
            THROW 59999, @mensagem, @erroNumero
        END TRY
        BEGIN CATCH
          SELECT  ERROR_NUMBER() AS ErrorNumber
                , ERROR_SEVERITY() AS ErrorSeverity
                , ERROR_STATE() AS ErrorState
                , ERROR_PROCEDURE() AS ErrorProcedure
                , ERROR_LINE() AS ErrorLine
                , ERROR_MESSAGE() AS ErrorMessage;
          IF (XACT_STATE()) = -1
          BEGIN
            PRINT ''[geo].[regiaoContinenteInclui] não pode ser concluída. Rolling back transaction.''
            ROLLBACK TRANSACTION;
          END
        END CATCH
        IF (XACT_STATE()) = 1
          COMMIT TRANSACTION;
      END
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
  DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
  DECLARE @ErrorState INT = ERROR_STATE()
  SET @ErrorMessage = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4 + char(10) + @ErrorMessage
  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH
