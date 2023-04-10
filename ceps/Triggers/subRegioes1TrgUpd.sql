/* 
 * TRIGGER: [subRegioes1TrgUpd] 
 */

CREATE TRIGGER [subRegioes1TrgUpd] ON subRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @subRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM paisesSubRegioes ch, deleted
          WHERE ch.subRegID = deleted.subRegID) != 0)
        BEGIN
            RAISERROR 30001 'subRegioes1TrgUpdCannot update because foreign keys still exist in paisesSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesSubRegioes ch, deleted
          WHERE ch.subRegID = deleted.subRegID) != 0)
        BEGIN
            RAISERROR 30001 'subRegioes1TrgUpdCannot update because foreign keys still exist in nacoesSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subRegioesRegioes ch, deleted
          WHERE ch.subRegID = deleted.subRegID) != 0)
        BEGIN
            RAISERROR 30001 'subRegioes1TrgUpdCannot update because foreign keys still exist in subRegioesRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subRegioes1TrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subRegioes1TrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subRegioes1TrgUpd >>>'
go


