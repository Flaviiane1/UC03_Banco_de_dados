USE lanchonete;

DROP TRIGGER IF EXISTS tg_item_baixa_estoque;
DELIMITER //
CREATE TRIGGER tg_item_baixa_estoque AFTER INSERT ON item_pedido
FOR EACH ROW
BEGIN 
UPDATE estoque
SET quantidade = quantidade - NEW.quantidade
WHERE produto_codigo = NEW.produto_codigo
AND unidade_codigo = (
SELECT unidade_codigo
FROM pedido
WHERE numero = NEW.pedido_numero
);
END //
DELIMITER;

DROP TABLE EXISTS log_preco_produto;
CREATE TABLE log_preco_produto (
id              INT AUTO_INCREMENT PRIMARY KEY
produto_codigo  INT NOT NULL,
preco_antigo    DECIMAL(6, 2) NOT NULL,
preco_novo      DECIMAL(6, 2) NOT NULL,
alterado_em     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
usuario         VARCHAR(100) NOT NULL,
FOREIGN KEY (produto_codigo) REFERENCES produto (codigo)
);

DROP TRIGGER IF EXISTS tg_produto_preco;
DELIMITER //
CREATE TRIGGER tg_produto_preco AFTER UPDATE ON produto
FOR EACH ROW 
BEGIN 
IF OLD.preco_tabela <> NEW.preco_tabela THEN
INSERT INTO log_preco_produto (produto_codigo, preco_antigo, preco_novo, alterado_em, usuario)
VALUES (NEW.codigo, OLD.preco_tabela, NEW.preco_tabela, NOW(), USER());
END IF;
END //
DELIMITER ;

INSERT INTO item_pedido (pedido_numero, produto_codigo, quantidade, preco_cobrado) VALUES 
(11, 1, 2, 12.00),
(11, 5, 1, 15.00);
SELECT * FROM estoque WHERE unidade_codigo = 1;
UPDATE produto SET preco_tabela = 9.00 WHERE codigo = 1;
SELECT 
l.id,
p.nome AS produto_nome,
l.preco_antigo,
l.preco_novo,
l.alterado_em,
l.usuario
FROM log_preco_produto 1
JOIN produto p ON l.produto_codigo = p.codigo;

