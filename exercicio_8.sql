
DELIMITER //
CREATE PROCEDURE AutorMaisAntigo()
BEGIN
    DECLARE minData DATE;
    DECLARE autorMaisAntigo VARCHAR(255);

    SELECT MIN(Data_Nascimento) INTO minData FROM Autor;
    
    SELECT CONCAT(Nome, ' ', Sobrenome) INTO autorMaisAntigo
    FROM Autor
    WHERE Data_Nascimento = minData;
    
    SELECT autorMaisAntigo AS Autor_Mais_Antigo;
END //
DELIMITER ;

CALL AutorMaisAntigo();
