/* 
 * TRIGGER: [nacoesRegioesTrgIns] 
 */

CREATE TRIGGER [nacoesRegioesTrgIns] ON nacoesRegioes
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
        RAISERROR 30000 'nacoesRegioesTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioes pr, inserted
         WHERE pr.regID = inserted.regID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesRegioesTrgInsCannot insert because primary key value not found in regioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesRegioesTrgIns >>>'
go


