/* Prática 13 – Lanchonete – perguntas ao banco
   Salve este arquivo como pratica-13.sql antes de começar. */
USE lanchonete;

-- pergunta 1:
SELECT nome, preco AS preco_rs
FROM produtos;

-- pergunta 2:
SELECT DISTINCT id_unidade
FROM pedidos;

-- pergunta 3:
SELECT *
FROM produtos
WHERE preco BETWEEN 12 AND 15;

-- pergunta 4:
SELECT *
FROM produtos
WHERE nome LIKE 'Açaí%';

-- pergunta 5:
SELECT *
FROM pedidos 
WHERE id_entregador IS NULL;

-- pergunta 6:
SELECT *
FROM pedidos 
WHERE id_unidade IN (1, 3);

-- pergunta 7:
SELECT * 
FROM produtos
WHERE status = 'disponivel'
ORDER BY preco DESC
LIMIT 3;

-- pergunta 8:
SELECT *
FROM pedidos
ORDER BY data_pedido DESC;