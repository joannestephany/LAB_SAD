
-- fazendo a procedure
CREATE OR REPLACE PROCEDURE SP_INCLUI_FORNECEDOR (FORNECEDOR IN VARCHAR2, CONTATO IN VARCHAR2)
AS
    BEGIN
        INSERT INTO TB_FORNECEDOR (nm_fornecedor, nm_contato)
        VALUES (fornecedor, contato);
    END;
    
    
-- testando a procedure
BEGIN
SP_INCLUI_FORNECEDOR('chocolate','pombo correio');
SELECT * FROM tb_fornecedor;
END;

-- ESTÁ DANDO ALGUM ERRO