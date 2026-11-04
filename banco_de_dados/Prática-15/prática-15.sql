USE lanchonete;

SELECT p.numero, c.nome
FROM pedido p
INNER JOIN cliente c ON p.cliente_codigo = c.codigo;

SELECT p.numero, p.data+_data_hora, u.nome
FROM item_pedido ip
INNER JOIN unidade u ON p.unidade_codigo = u.codigo
WHERE u.nome = 'Ponta verde';

SELECT p.data_hora, pr.nome, ip.quantidade
FROM item_pedido ip
INNER JOIN pedido p ON ip.pedido_numero = p.numero
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
WHERE p.numero = 4;

SELECT pr.nome, SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
GROUP BY pr.nome
ORDER BY total_vendido DESC;

SELECT pr.nome
FROM produto pr 
LEFT JOIN item_pedido ip ON pr.codigo = ip.produto_codigo
WHERE ip.produto_codigo IS NULL;

SELECT c.nome
FROM cliente crossLEFT JOIN pedido p ON c.codigo = p.cliente_codigo
WHERE p.nome IS NULL;

SELECT nome, preco_tabela
FROM produto
WHERE preco_tbela > (SELECT AVG(preco_tabela) FROM produto);

SELECT AVG(t.total_pedidos) AS media_pedidos
FROM (
SELECT unidade_codigo, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY unidade_codigo
) AS t;