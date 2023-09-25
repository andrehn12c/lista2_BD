DELIMITER // -- Define os limites da stored procedure
CREATE PROCEDURE GetBooksByAuthor(IN authorName VARCHAR(255))
BEGIN -- Marca o início do bloco de código da stored procedure 
    SELECT Livro.Titulo -- Consulta que a stored procedure realiza; o corpo do código
    FROM Livro
    JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
    WHERE CONCAT(Autor.Nome, ' ', Autor.Sobrenome) = authorName;
END // -- Define o final do bloco de código da stored procedure
DELIMITER ;

-- Exemplo de como chamar uma stored procedure. Nesse caso, ela retorna o valor de todos os livros escritos pelo autor "Joaquim Silva"z
CALL GetBooksByAuthor('Joaquim Silva');
