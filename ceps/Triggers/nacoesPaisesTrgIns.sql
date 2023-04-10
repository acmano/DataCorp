/* 
 * TRIGGER: [nacoesPaisesTrgIns] 
 */

CREATE TRIGGER [nacoesPaisesTrgIns] ON nacoesPaises
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
         FROM nacoes pr, inserted
         WHERE pr.nacID = inserted.nacID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesPaisesTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM paises pr, inserted
         WHERE pr.paiID = inserted.paiID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesPaisesTrgInsCannot insert because primary key value not found in paises'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesPaisesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesPaisesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesPaisesTrgIns >>>'
go


