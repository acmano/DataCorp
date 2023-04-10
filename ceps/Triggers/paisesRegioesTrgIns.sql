/* 
 * TRIGGER: [paisesRegioesTrgIns] 
 */

CREATE TRIGGER [paisesRegioesTrgIns] ON paisesRegioes
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

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.paiID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM paises pr, inserted
        WHERE pr.paiID = inserted.paiID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'paisesRegioesTrgInsCannot insert because primary key value not found in paises'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioes pr, inserted
         WHERE pr.regID = inserted.regID) != @Rows)
    BEGIN
        RAISERROR 30000 'paisesRegioesTrgInsCannot insert because primary key value not found in regioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('paisesRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesRegioesTrgIns >>>'
go


