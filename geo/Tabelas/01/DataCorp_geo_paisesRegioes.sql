
--  mestreTabelaPrefixo           = reg
--  mestreTabelaPrefixoMaiuscula  = Reg
--  mestreTabelaNomeSingular      = regiao
--  mestreTabelaChave             = regId
--  mestreTabelaChaveAk           = regiaoNome
--  mestreFuncaoExiste            = regiaoExiste
--  mestreFuncaoId                = regiaoId
--  detalheTabelaPrefixo          = pai
--  detalheTabelaPrefixoMaiuscula = Pai
--  detalheTabelaNomeSingular     = pais
--  detalheTabelaChave            = paiId
--  detalheTabelaChaveAk          = paisNome
--  detalheFuncaoExiste           = paisExiste
--  detalheFuncaoId               = paisId
--  novaTabelaNomeSingular        = paisRegiao
--  novaTabelaPk                  = paiReg
--  novaTabelaPkNome              = paiRegPk
--  novaTabelaChave               = paiRegId
--  novaTabelaChaveMaiuscula      = PaiRegId
--  novaTabelaNomePrefixo         = paiReg
--  novaTabelaIxAkNome            = paiRegIxAk
--  novaTabelaIxFkMestreNome      = paiRegIxFkReg
--  novaTabelaFkMestreNome        = paiRegFkReg
--  novaTabelaIxFkDetalheNome     = paiRegIxFk
--  novaTabelaFkDetalheNome       = paiRegFk
--  novaTabelaFuncaoInclui        = paisRegiaoInclui

/*
* TABELA: [DataCorp].[geo].[paisesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkReg] >>>'
  IF OBJECT_ID('[geo].[paiRegFkReg]') IS NOT NULL
    ALTER TABLE [geo].[paisesRegioes]
      DROP CONSTRAINT [paiRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFk] >>>'
  IF OBJECT_ID('[geo].[paiRegFk]') IS NOT NULL
    ALTER TABLE [geo].[paisesRegioes]
      DROP CONSTRAINT [paiRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[paisesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'paisesRegioes' )
  BEGIN
    DROP TABLE [geo].[paisesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[paisesRegioes]
  (

    [paiRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [paisesRegioesPaiRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [paisesRegioesRegIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [paisesRegioesPaiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[paisesRegioes].[paiRegPk] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegPk]
      PRIMARY KEY CLUSTERED
      (
        [paiRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxAk')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxAk] >>>'
  CREATE UNIQUE INDEX [paiRegIxAk]
    ON [geo].[paisesRegioes]
    (
      [regId]
    , [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFkReg')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [paiRegIxFkReg]
    ON [geo].[paisesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkReg] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegFkReg]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFk')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [paiRegIxFk]
    ON [geo].[paisesRegioes]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[paisRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[paisRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisRegiaoExiste]
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
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[paisesRegioes] nova
            ON  nova.regId = mestre.regId
          INNER JOIN [DataCorp].[geo].[paises] detalhe
            ON  detalhe.paiId = nova.paiId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[paisRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[paisRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisRegiaoId]
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
        SELECT  @ID = nova.paiRegId
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[paisesRegioes] nova
            ON  nova.regId = mestre.regId
          INNER JOIN [DataCorp].[geo].[paises] detalhe
            ON  detalhe.paiId = nova.paiId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFk] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegFk]
    FOREIGN KEY
    (
      [paiId]
    )
    REFERENCES [DataCorp].[geo].[paises]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[paisRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[paisRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[paisRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[paisRegiaoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @regId  INTEGER
      DECLARE @paiId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[regiaoExiste] ( @mestreNome ) não existe!''
          IF  [geo].[regiaoExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[regiaoId] ( @mestreNome ) não encontrado!''
            SET @regId = [geo].[regiaoId] ( @mestreNome )
            IF  @regId != 0
            BEGIN
              SET @erroNumero = 3
              SET @mensagem = ''Execução: [geo].[paisExiste] ( @detalheNome ) não existe!''
              IF  [geo].[paisExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[paisId] ( @detalheNome ) não encontrado!''
                SET @paiId = [geo].[paisId] ( @detalheNome )
                IF  @paiId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[paisRegiaoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[paisRegiaoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[paisesRegioes] VALUES ( @regId , @paiId )''
                    INSERT
                      INTO  [geo].[paisesRegioes]
                      (
                        regId
                      , paiId
                      )
                      VALUES
                      (
                        @regId
                      , @paiId
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
            PRINT ''[geo].[paisRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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
