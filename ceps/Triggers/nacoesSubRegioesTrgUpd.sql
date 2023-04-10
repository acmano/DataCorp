/* 
 * TRIGGER: [nacoesSubRegioesTrgUpd] 
 */

CREATE TRIGGER [nacoesSubRegioesTrgUpd] ON nacoesSubRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @nacSubRegID int,
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
            RAISERROR 30001 'nacoesSubRegioesTrgUpdCannot update because primary key value not found in nacoes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subRegioes pr, inserted
          WHERE pr.subRegID = inserted.subRegID) != @Rows)
        BEGIN
            RAISERROR 30001 'nacoesSubRegioesTrgUpdCannot update because primary key value not found in subRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesSubRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesSubRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesSubRegioesTrgUpd >>>'
go


