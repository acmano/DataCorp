/* 
 * TRIGGER: [sufixosTiposSufixosTrgIns] 
 */

CREATE TRIGGER [sufixosTiposSufixosTrgIns] ON sufixosTiposSufixos
FOR INSERT AS
BEGIN
    DECLARE
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM sufixosTipos pr, inserted
         WHERE pr.sufTipID = inserted.sufTipID) != @Rows)
    BEGIN
        RAISERROR 30000 'sufixosTiposSufixosTrgInsCannot insert because primary key value not found in sufixosTipos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.sufID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM sufixos pr, inserted
        WHERE pr.sufID = inserted.sufID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'sufixosTiposSufixosTrgInsCannot insert because primary key value not found in sufixos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('sufixosTiposSufixosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTiposSufixosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTiposSufixosTrgIns >>>'
go


