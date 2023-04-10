/* 
 * TRIGGER: [sufixosTrgUpd] 
 */

CREATE TRIGGER [sufixosTrgUpd] ON sufixos
FOR UPDATE AS
BEGIN
    DECLARE
        @sufID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(sufID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM sufixosTiposSufixos ch, deleted
          WHERE ch.sufID = deleted.sufID) != 0)
        BEGIN
            RAISERROR 30001 'sufixosTrgUpdCannot update because foreign keys still exist in sufixosTiposSufixos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(sufID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM ceps ch, deleted
          WHERE ch.sufID = deleted.sufID) != 0)
        BEGIN
            RAISERROR 30001 'sufixosTrgUpdCannot update because foreign keys still exist in ceps'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('sufixosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTrgUpd >>>'
go


