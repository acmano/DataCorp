/* 
 * TRIGGER: [nacoesContinentesTrgUpd] 
 */

CREATE TRIGGER [nacoesContinentesTrgUpd] ON nacoesContinentes
FOR UPDATE AS
BEGIN
    DECLARE
        @nacCntID int,
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
            RAISERROR 30001 'nacoesContinentesTrgUpdCannot update because primary key value not found in nacoes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM continentes pr, inserted
          WHERE pr.ctnID = inserted.ctnID) != @Rows)
        BEGIN
            RAISERROR 30001 'nacoesContinentesTrgUpdCannot update because primary key value not found in continentes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesContinentesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesContinentesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesContinentesTrgUpd >>>'
go


