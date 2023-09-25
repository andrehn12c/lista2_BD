DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN ano_param INT)
BEGIN
    SELECT Livro.Titulo, Livro.Ano_Publicacao
    FROM Livro
    WHERE Livro.Ano_Publicacao <= ano_param;
END //
DELIMITER ;

CALL sp_LivrosAteAno(2005);