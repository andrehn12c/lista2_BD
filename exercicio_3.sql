DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    SELECT Categoria.Nome, COUNT(*) AS TotalLivrosNaCategoria
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome
    GROUP BY Categoria.Nome;
END //
DELIMITER ;

CALL sp_ContarLivrosPorCategoria('Romance');