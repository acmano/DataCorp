/* 
 * TRIGGER: [paisesSubRegioesTrgIns] 
 */

CREATE TRIGGER [paisesSubRegioesTrgIns] ON paisesSubRegioes
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
         FROM subRegioes pr, inserted
         WHERE pr.subRegID = inserted.subRegID) != @Rows)
    BEGIN
        RAISERROR 30000 'paisesSubRegioesTrgInsCannot insert because primary key value not found in subRegioes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM paises pr, inserted
         WHERE pr.paiID = inserted.paiID) != @Rows)
    BEGIN
        RAISERROR 30000 'paisesSubRegioesTrgInsCannot insert because primary key value not found in paises'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('paisesSubRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesSubRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesSubRegioesTrgIns >>>'
go


