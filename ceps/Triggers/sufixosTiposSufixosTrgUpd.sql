/* 
 * TRIGGER: [sufixosTiposSufixosTrgUpd] 
 */

CREATE TRIGGER [sufixosTiposSufixosTrgUpd] ON sufixosTiposSufixos
FOR UPDATE AS
BEGIN
    DECLARE
        @sufTipSufID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(sufTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM sufixosTipos pr, inserted
          WHERE pr.sufTipID = inserted.sufTipID) != @Rows)
        BEGIN
            RAISERROR 30001 'sufixosTiposSufixosTrgUpdCannot update because primary key value not found in sufixosTipos'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(sufID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.sufID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM sufixos pr, inserted
          WHERE pr.sufID = inserted.sufID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'sufixosTiposSufixosTrgUpdCannot update because primary key value not found in sufixos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('sufixosTiposSufixosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTiposSufixosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTiposSufixosTrgUpd >>>'
go


