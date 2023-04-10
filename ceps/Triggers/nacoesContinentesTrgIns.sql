/* 
 * TRIGGER: [nacoesContinentesTrgIns] 
 */

CREATE TRIGGER [nacoesContinentesTrgIns] ON nacoesContinentes
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
        RAISERROR 30000 'nacoesContinentesTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM continentes pr, inserted
         WHERE pr.ctnID = inserted.ctnID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesContinentesTrgInsCannot insert because primary key value not found in continentes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesContinentesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesContinentesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesContinentesTrgIns >>>'
go


