
DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(
    IN p_Titulo VARCHAR(255),
    IN p_Editora_ID INT,
    IN p_Ano_Publicacao INT,
    IN p_Numero_Paginas INT,
    IN p_Categoria_ID INT
)
BEGIN
    DECLARE v_Exists INT;
    
    SELECT COUNT(*) INTO v_Exists FROM Livro WHERE Titulo = p_Titulo;
    
    IF v_Exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O livro com este título já existe na biblioteca.';
    ELSE
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (p_Titulo, p_Editora_ID, p_Ano_Publicacao, p_Numero_Paginas, p_Categoria_ID);
        
        SELECT LAST_INSERT_ID() AS Livro_ID;
    END IF;
END //
DELIMITER ;

CALL sp_AdicionarLivro('Novo Livro', 1, 2023, 400, 1);