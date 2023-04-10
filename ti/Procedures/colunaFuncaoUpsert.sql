USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[colunaFuncaoUpsert]
(
  @sistemaNome      VARCHAR(64)   -- AK da tabela
, @linguagemNome    VARCHAR(64)   -- AK da tabela
, @programaNome     VARCHAR(64)   -- AK da tabela
, @funcaoNome       VARCHAR(64)   -- AK da tabela
, @bancoNome        VARCHAR(64)
, @baseNome         VARCHAR(64)
, @objetoTipoCodigo CHAR(2)
, @objetoNome       VARCHAR(256)
, @colunaNome       VARCHAR(256) = NULL
, @grava            CHAR(1)      = NULL  --  Create
, @le               CHAR(1)      = NULL  --  Read
, @atualiza         CHAR(1)      = NULL  --  Update
, @exclui           CHAR(1)      = NULL  --  Delete
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @funcaoProgramaId BIGINT
  DECLARE @colunaObjetoId BIGINT
  DECLARE @colunaFuncaoId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[sistemaExiste] (@sistemaNome) = 0
      RAISERROR ( 'Sistema não cadastrado!', 16, 1 )
    IF  [ti].[programaExiste] (@sistemaNome, @linguagemNome, @programaNome) = 0
      RAISERROR ( 'Programa não cadastrado!', 16, 2 )
    IF  [ti].[funcaoExiste] (@sistemaNome, @linguagemNome, @programaNome, @funcaoNome) = 0
      RAISERROR ( 'Função não cadastrada!', 16, 3 )
    IF  [ti].[bancoExiste] (@bancoNome) = 0
      RAISERROR ( 'Banco não cadastrado!', 16, 4 )
    IF  [ti].[baseExiste] (@bancoNome, @baseNome) = 0
      RAISERROR ( 'Base não cadastrada!', 16, 5 )
    IF  [ti].[objetoTipoExiste] (@objetoTipoCodigo) = 0
      RAISERROR ( 'Tipo de Objeto não cadastrado!', 16, 6 )
    IF  [ti].[objetoExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
      RAISERROR ( 'Objeto não cadastrado!', 16, 7 )
    IF  [ti].[colunaExiste] (@colunaNome) = 0
      RAISERROR ( 'Coluna não cadastrada!', 16, 7 )
    IF  [ti].[colunaObjetoExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome, @colunaNome) = 0
      RAISERROR ( 'Coluna não relacionada ao Objeto!', 16, 7 )
    SET  @funcaoProgramaId = [ti].[funcaoProgramaId] ( @sistemaNome, @linguagemNome, @programaNome, @funcaoNome )
    SET  @colunaObjetoId = [ti].[colunaObjetoId] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome, @colunaNome)
    BEGIN TRAN 
    IF  @colunaNome IS NOT NULL
    BEGIN
      IF  [ti].[colunaExiste] (@colunaNome) = 0
        RAISERROR ( 'Coluna não cadastrada!', 16, 8 )
      SET @colunaFuncaoId = [ti].[colunaFuncaoId] (@sistemaNome, @programaNome, @funcaoNome, @bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome, @colunaNome )
      MERGE [ti].[colunasFuncoes] AS target
        USING
        (
          SELECT  @funcaoProgramaId
                , @colunaObjetoId
                , COALESCE ( @grava, 'S' )
                , COALESCE ( @le, 'S' )
                , COALESCE ( @atualiza, 'S' )
                , COALESCE ( @exclui, 'S' )
        )
        AS source
        (
          funProId
        , colObjId
        , grava
        , le
        , atualiza
        , exclui
        )
        ON
        (
              target.funProId = source.funProId
          AND target.colObjId = source.colObjId
        )
        WHEN MATCHED
        THEN
          UPDATE
            SET   target.grava = source.grava
                , target.le = source.le
                , target.atualiza = source.atualiza
                , target.exclui = source.exclui
        WHEN NOT MATCHED
        THEN
          INSERT ( funProId, colObjId, grava, le, atualiza, exclui )
            VALUES ( source.funProId, source.colObjId, source.grava, source.le, source.atualiza, source.exclui )
      ;
    END
    ELSE
    BEGIN
      DECLARE colunasObjeto
        CURSOR FOR
          SELECT  colunaObjeto.colObjId
                , COALESCE ( colunaFuncao.grava, 'S' )
                , COALESCE ( colunaFuncao.le, 'S' )
                , COALESCE ( colunaFuncao.atualiza, 'S' )
                , COALESCE ( colunaFuncao.exclui, 'S' )
            FROM       [ti].[bancos] banco
            INNER JOIN [ti].[basesBancos] baseBanco
              ON  baseBanco.banId = banco.banId
            INNER JOIN [ti].[bases] base 
              ON  base.basId = baseBanco.basId
            INNER JOIN [ti].[objetosBases] objetoBase 
              ON  objetoBase.basId = base.basId
            INNER JOIN [ti].[objetos] objeto
              ON  objeto.objId = objetoBase.objId
            INNER JOIN [ti].[objetosTiposObjetos] objetoTipoObjeto
              ON  objetoTipoObjeto.objId = objeto.objId
            INNER JOIN [ti].[objetosTipos] objetoTipo
              ON  objetoTipo.objTipId = objetoTipoObjeto.objTipId
            INNER JOIN [ti].[colunasObjetos] colunaObjeto
              ON  colunaObjeto.objId = objeto.objId
            INNER JOIN [ti].[colunas] coluna
              ON  coluna.colId = colunaObjeto.colId
            LEFT  OUTER JOIN
            (
                        [ti].[sistemas] sistema
              INNER JOIN [ti].[programasSistemas] programaSistema
                ON  programaSistema.sisId = sistema.sisId
              INNER JOIN [ti].[programas] programa
                ON  programa.proId = programaSistema.proId
              INNER JOIN [ti].[funcoesProgramas]  funcaoPrograma
                ON  funcaoPrograma.proId = programa.proId
              INNER JOIN [ti].[funcoes] funcao
                ON  funcao.funId = funcaoPrograma.funId
              INNER JOIN [ti].[colunasFuncoes] colunaFuncao
                ON  colunaFuncao.funProId = funcaoPrograma.funProId
            )
              ON  colunaFuncao.colObjId
                = colunaObjeto.colObjId
            WHERE banco.nome = @bancoNome
            AND   base.nome = @baseNome
            AND   objeto.nome = @objetoNome
            AND   sistema.nome = @sistemaNome
            AND   programa.nome = @programaNome
            AND   funcao.nome = @funcaoNome
      OPEN colunasObjeto
      FETCH NEXT
        FROM  colunasObjeto
        INTO  @colunaObjetoId
            , @grava
            , @le
            , @atualiza
            , @exclui
      WHILE @@FETCH_STATUS = 0
      BEGIN
        MERGE [ti].[colunasFuncoes] AS target
          USING
          (
            SELECT  @funcaoProgramaId
                  , @colunaObjetoId
                  , COALESCE ( @grava, 'S' )
                  , COALESCE ( @le, 'S' )
                  , COALESCE ( @atualiza, 'S' )
                  , COALESCE ( @exclui, 'S' )
          )
          AS source
          (
            funProId
          , colObjId
          , grava
          , le
          , atualiza
          , exclui
          )
          ON
          (
                target.funProId = source.funProId
            AND target.colObjId = source.colObjId
          )
          WHEN MATCHED
          THEN
            UPDATE
              SET   target.grava = source.grava
                  , target.le = source.le
                  , target.atualiza = source.atualiza
                  , target.exclui = source.exclui
          WHEN NOT MATCHED
          THEN
            INSERT
            (
              funProId
            , colObjId
            , grava
            , le
            , atualiza
            , exclui
            )
            VALUES
            (
              source.funProId
            , source.colObjId
            , source.grava
            , source.le
            , source.atualiza
            , source.exclui
            )
        ;
        FETCH NEXT
          FROM  colunasObjeto
          INTO  @colunaObjetoId
              , @grava
              , @le
              , @atualiza
              , @exclui
      END
      CLOSE colunasObjeto
      DEALLOCATE colunasObjeto
    END
    COMMIT TRAN
    END TRY
    BEGIN CATCH
      -- Se ocorrer um erro, desfaz a transação
      IF @@TRANCOUNT > 0
          ROLLBACK TRAN
      -- Retorna uma mensagem de erro
      DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
      DECLARE @ErrorState INT = ERROR_STATE()
      SET @ErrorMessage = ERROR_MESSAGE()
      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
END