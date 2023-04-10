/* 
 * TRIGGER: [regioesContinentesTrgUpd] 
 */

CREATE TRIGGER [regioesContinentesTrgUpd] ON regioesContinentes
FOR UPDATE AS
BEGIN
    DECLARE
        @regCtnID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM continentes pr, inserted
          WHERE pr.ctnID = inserted.ctnID) != @Rows)
        BEGIN
            RAISERROR 30001 'regioesContinentesTrgUpdCannot update because primary key value not found in continentes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioes pr, inserted
          WHERE pr.regID = inserted.regID) != @Rows)
        BEGIN
            RAISERROR 30001 'regioesContinentesTrgUpdCannot update because primary key value not found in regioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesContinentesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesContinentesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesContinentesTrgUpd >>>'
go


