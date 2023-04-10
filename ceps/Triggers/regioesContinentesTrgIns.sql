/* 
 * TRIGGER: [regioesContinentesTrgIns] 
 */

CREATE TRIGGER [regioesContinentesTrgIns] ON regioesContinentes
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
         FROM continentes pr, inserted
         WHERE pr.ctnID = inserted.ctnID) != @Rows)
    BEGIN
        RAISERROR 30000 'regioesContinentesTrgInsCannot insert because primary key value not found in continentes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioes pr, inserted
         WHERE pr.regID = inserted.regID) != @Rows)
    BEGIN
        RAISERROR 30000 'regioesContinentesTrgInsCannot insert because primary key value not found in regioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesContinentesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesContinentesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesContinentesTrgIns >>>'
go


