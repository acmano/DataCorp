/* 
 * TRIGGER: [sufixosTiposTrgUpd] 
 */

CREATE TRIGGER [sufixosTiposTrgUpd] ON sufixosTipos
FOR UPDATE AS
BEGIN
    DECLARE
        @sufTipID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(sufTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM sufixosTiposSufixos ch, deleted
          WHERE ch.sufTipID = deleted.sufTipID) != 0)
        BEGIN
            RAISERROR 30001 'sufixosTiposTrgUpdCannot update because foreign keys still exist in sufixosTiposSufixos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('sufixosTiposTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTiposTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTiposTrgUpd >>>'
go


