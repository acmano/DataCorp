/* 
 * TRIGGER: [nacoesRegioesTrgUpd] 
 */

CREATE TRIGGER [nacoesRegioesTrgUpd] ON nacoesRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @nacRegID int,
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
            RAISERROR 30001 'nacoesRegioesTrgUpdCannot update because primary key value not found in nacoes'
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
            RAISERROR 30001 'nacoesRegioesTrgUpdCannot update because primary key value not found in regioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesRegioesTrgUpd >>>'
go


