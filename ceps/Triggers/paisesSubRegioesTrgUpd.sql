/* 
 * TRIGGER: [paisesSubRegioesTrgUpd] 
 */

CREATE TRIGGER [paisesSubRegioesTrgUpd] ON paisesSubRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @paiSubRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subRegioes pr, inserted
          WHERE pr.subRegID = inserted.subRegID) != @Rows)
        BEGIN
            RAISERROR 30001 'paisesSubRegioesTrgUpdCannot update because primary key value not found in subRegioes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(paiID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM paises pr, inserted
          WHERE pr.paiID = inserted.paiID) != @Rows)
        BEGIN
            RAISERROR 30001 'paisesSubRegioesTrgUpdCannot update because primary key value not found in paises'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('paisesSubRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesSubRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesSubRegioesTrgUpd >>>'
go


