USE lanchonete;

SELECT nome, preco_tabela AS preco_rs
FROM produto;

SELECT DISTINCT unidade_codigo
FROM pedido;

SELECT nome, preco_tabela
FROM produto 
WHERE preco_tabela BETWEEN 12 AND 15;

SELECT nome
FROM produto
WHERE nome LIKE 'açaí%';

SELECT numero
FROM pedido
WHERE entregador_codigo IS NULL;

SELECT numero
FROM pedido
WHERE unidade_codigo IN (1, 3);

SELECT nome, preco_tabela
FROM produto 
WHERE disponivel = TRUE 
ORDER BY preco_tabela DESC
LIMIT 3;

SELECT numero, data_hora
FROM pedido
ORDER BY data_hora DESC;