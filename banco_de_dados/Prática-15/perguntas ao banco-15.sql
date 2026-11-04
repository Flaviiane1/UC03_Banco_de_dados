/* Prática 15 – Lanchonete – juntando as tabelas
   Salve este arquivo como pratica-15.sql antes de começar. */
USE lanchonete;

-- pergunta 1:
SELECT p.numero, c.nome
FROM pedido p
INNER JOIN cliente c ON p.cliente_codigo = c.codigo;

-- pergunta 2:
SELECT p.numero, p.data_hora, u.nome
FROM pedido p
INNER JOIN unidade u ON p.unidade_codigo = u.codigo
WHERE u.nome = 'Ponta Verde';

-- pergunta 3:
SELECT p.data_hora, pr.nome, ip.pedido_numero = p.numero
FROM item_pedido ip
INNER JOIN pedido p ON ip.pedido_numero = p.numero
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
WHERE p.numero = 4;

-- pergunta 4:
SELECT pr.nome, SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
GROUP BY pr.nome
ORDER BY total_vendido DESC;

-- pergunta 5:
SELECT pr.nome
FROM produto pr
LEFT JOIN item_pedido ip ON pr.codigo = ip.produto_codigo
WHERE ip.produto_codigo IS NULL;

-- pergunta 6:
SELECT c.nome
FROM cliente c
LEFT JOIN pedido p ON c.codigo = p.cliente_codigo
WHERE p.numero IS NULL;

-- pergunta 7:
SELECT nome, preco_tabela
FROM produto
WHERE preco_tabela > (SELECT AVG(preco_tabela) FROM produto);

-- pergunta 8:
SELECT AVG(t.total_pedidos) AS media_pedidos
FROM (
SELECT unidade_codigo, COUNT(*) AS total_pedidos 
FROM pedidos 
GROUP BY unidade_codigo
) AS t;
