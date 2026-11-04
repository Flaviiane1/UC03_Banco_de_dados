USE lanchonete;
SELECT COUNT(*) AS total_pedidos
FROM pedido;

SELECT SUM(quantidade) AS total_unidades_vendidas
FROM item_pedido;

SELECT ROUND(AVG(preco_cobrado), 2) AS preco_medio, MAX(preco_cobrado) AS maior_preco
FROM item_pedido;

SELECT unidade_codigo, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY unidade_codigo;

SELECT produto_codigo, SUM(quantidade) AS total_vendido
FROM item_pedido
GROUP BY produto_codigo
ORDER BY total_vendido DESC;

SELECT produto_codigo, SUM(quantidade)
FROM item_pedido
GROUP BY produto_cogigo
HAVING total_vendido >= 3;
SELECT DATE_FORMAT(data_hora, '%d/%m') AS dia_formatado, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY dia_formatado
ORDER BY MIN(data_hora);

SELECT CONCAT(UPPER(nome), ' - R$ ', preco_tabela) AS etiqueta_cardapio
FROM produto
WHERE disponivel = TRUE;