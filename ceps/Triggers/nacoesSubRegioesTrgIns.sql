/* 
 * TRIGGER: [nacoesSubRegioesTrgIns] 
 */

CREATE TRIGGER [nacoesSubRegioesTrgIns] ON nacoesSubRegioes
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
        RAISERROR 30000 'nacoesSubRegioesTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subRegioes pr, inserted
         WHERE pr.subRegID = inserted.subRegID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesSubRegioesTrgInsCannot insert because primary key value not found in subRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesSubRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesSubRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesSubRegioesTrgIns >>>'
go


