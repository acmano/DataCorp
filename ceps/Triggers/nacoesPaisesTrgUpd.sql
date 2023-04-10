/* 
 * TRIGGER: [nacoesPaisesTrgUpd] 
 */

CREATE TRIGGER [nacoesPaisesTrgUpd] ON nacoesPaises
FOR UPDATE AS
BEGIN
    DECLARE
        @nacPaiID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoes pr, inserted
          WHERE pr.nacID = inserted.nacID) != @Rows)
        BEGIN
            RAISERROR 30001 'nacoesPaisesTrgUpdCannot update because primary key value not found in nacoes'
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
            RAISERROR 30001 'nacoesPaisesTrgUpdCannot update because primary key value not found in paises'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesPaisesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesPaisesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesPaisesTrgUpd >>>'
go


