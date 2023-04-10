/* 
 * TRIGGER: [nacoesMundosTrgIns] 
 */

CREATE TRIGGER [nacoesMundosTrgIns] ON nacoesMundos
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
        RAISERROR 30000 'nacoesMundosTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM mundos pr, inserted
         WHERE pr.munID = inserted.munID) != @Rows)
    BEGIN
        RAISERROR 30000 'nacoesMundosTrgInsCannot insert because primary key value not found in mundos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesMundosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesMundosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesMundosTrgIns >>>'
go


