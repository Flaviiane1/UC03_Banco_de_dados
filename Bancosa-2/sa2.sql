/* SA2 - Implementação e manipulação do banco de embalagens
Aluna: Flaviane Maria*/
USE embalagens;

INSERT INTO ordem_producao (data_ordem, qtd_planejada, qtd_boa, qtd_refugo, consumo_kg, unidade_codigo, produto_codigo) VALUES
('2026-11-03', 5000, 4800, 200, 60.00, 1, 1),
('2026-11-03', 5000, 4950, 50, 25.00, 1, 2),
('2026-11-04', 8000, 7650, 350, 160.00, 2, 3),
('2026-11-05', 3000, 2880, 120, 18.00, 3, 2),
('2026-11-05', 4000, 3900, 100, 48.00, 1, 1);

INSERT INTO expedicao (data_saida, unidade_codigo, cliente_cnpj) VALUES 
(1, 1, 2000, 0.45),
(1, 2, 2000, 0.12),
(2, 3, 5000, 0.65);

UPDATE produto
SET preco_tabela = 0.48
WHERE codigo = 1;

SELECT *
FROM ordem_producao
WHERE qtd_refugo > 100
ORDER BY qtd_refugo DESC;

SELECT p.nome,
  SUM(op.qtd_refugo) AS total_refugo
  FROM produto p
  INNER JOIN ordem_producao op ON p.codigo = op.produto_codigo
  GROUP BY p.codigo, p.nome
  ORDER BY total_refugo DESC;
  
  SELECT u.nome,
    SUM(op.qtd_boa) AS total_pecas_boas
    FROM unidade u
    INNER JOIN ordem_producao op ON u.codigo = op.unidade_codigo
    GROUP BY u.codigo, u.nome
    HAVING SUM(op.qtd_boa) > 5000
    ORDER BY total_pecas_boas DESC;
    
    sELECT c.razao_social AS cliente,
    u.nome AS unidade
    p.nome AS produto,
    ie.quantidade,
    (ie.quantidade * ie.preco_cobrado) AS valor_total
    FROM item_expedicao ie
    INNER JOIN expedicao e ON ie.expedicao_numero = e.numero
    INNER JOIN cliente c ON e.cliente_cnpj = c.cnpj
    INNER JOIN unidade u ON e.unidade_codigo = u.codigo;
    
    SELECT c.cnpj,
    c.razao_social,
    c.cidade
    FROM cliente c
    LEFT JOIN expedicao e ON c.cnpj = e.cliente_cnpj
    WHERE e.numero IS NULL;
    
    CREATE VIEW vw_refugo_produto AS
    SELECT p.nome,
    SUM(op.qtd_refugo) AS total_refugo
    fROM produto p
    INNER JOIN ordem_producao op ON p.codigo = op.produto_codigo
    GROUP BY p.codigo, p.nome
    ORDER BY total_refugo DESC;
    
    CREATE PROCEDURE sp_registrar_item (
    IN p_expedicao_numero INT,
    IN p_produto_codigo INT,
    INT p_quantidade INT
    )
    BEGIN
    DECLARE v_preco DECIMAL(8, 2);
    SELECT preco_tabela
    INTO v_preco
    FROM produto
    WHERE codigo = p_produto_codigo;
    INSERT INTO item_expedicao (expedicao_numero, produto_codigo, quantidade, preco_cobrado)
    VALUES (p_expedicao_numero, p_produto_codigo, p_quantidade, v_preco);
    END 
    DELIMITER;
    
    CALL sp_registrar_item(2, 4, 5000);
    SELECT * FROM item_expedicao WHERE expedicao_numero = 2 AND produto_codigo = 4;
    DELIMITER 
    CREATE TRIGGER tg_ordem_baixa_resina
    AFTER INSERT ON ordem_producao
    FOR EACH ROW
    BEGIN
    DECLARE v_resina_codigo INT;
    SELECT resina_codigo
    INTO v_resina_codigo
    FROM produto
    WHERE codigo = NEW.produto_codigo;
    UPDATE estoque_resina
    SET quantidade_kg = quantidade_kg - NEW.consumo_kg
    WHERE unidade_codigo = NEW.unidade_codigo
    AND resina_codigo = v_resina__codigo;
    END 
    DELIMITER;
    
    INSERT INTO ordem_producao (data_ordem, qtd_planejada, qtd_boa, qtd_refugo, consumo_kg, unidade_codigo, produto_codigo)
    VALUES ('2026=11=09', 1000, 950, 50, 20.00, 2, 3);
    SELECT * FROM estoque_resina WHERE unidade_codigo 2 AND resina__codigo = 3;
    
    GRAND SELECT, INSERT ON embalagens.ordem_producao TO 'emb_operador'@'localhost;
    GRAND SELECT ON embalagens.produto TO 'emb_operador'@'localhost';
    
    GRAND INSERT, UPDATE, DELETE ON embalagens.produto TO 'emb_gerente'@'localhost';
    
    FLUSH PRIVILEGES;
    
    SHOW GRANTS FOR 'emb_operador'@'localhost';
    SHOW GRANTS FOR 'emb_gerente'@'localhost';