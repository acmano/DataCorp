/* 
 * TRIGGER: [nacoesMundosTrgUpd] 
 */

CREATE TRIGGER [nacoesMundosTrgUpd] ON nacoesMundos
FOR UPDATE AS
BEGIN
    DECLARE
        @nacMunID int,
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
            RAISERROR 30001 'nacoesMundosTrgUpdCannot update because primary key value not found in nacoes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM mundos pr, inserted
          WHERE pr.munID = inserted.munID) != @Rows)
        BEGIN
            RAISERROR 30001 'nacoesMundosTrgUpdCannot update because primary key value not found in mundos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesMundosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesMundosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesMundosTrgUpd >>>'
go


