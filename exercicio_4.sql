DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100), OUT possuiLivros INT)
BEGIN
  DECLARE categoriaID INT;

  SELECT Categoria_ID INTO categoriaID FROM Categoria WHERE Nome = categoriaNome;

  IF categoriaID IS NULL THEN
    SET possuiLivros = 0;
  ELSE
    SELECT COUNT(*) INTO possuiLivros FROM Livro WHERE Categoria_ID = categoriaID;
  END IF;
END //
DELIMITER ;

SELECT @possuiLivros;