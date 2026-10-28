-- unidades da rede
CREATE TABLE unidade (
codigo INT AUTO_INCREMENT PRIMARY KEY,
-- dica: texto curto, como o nome do servico
nome VARCHAR(60) NOT NULL,
-- dica: na figura, endereço sem regra: aceita vazio
endereco VARCHAR(150),
-- dica: escreva entre as aspas o que a tabela guarda
) COMMENT = 'unidades da rede'
-- clientes: o telefone não se repete
CREATE TABLE cliente (
codigo INT AUTO_INCREMENT PRIMARY KEY,
-- dica: na figura, a regra ao lado de nome
nome VARCHAR(80) NOT NULL,
-- dica: na figura, a regra ao lado de telefone
telefone VARCHAR(15) NOT NULL UNIQUE
);
-- cardápio: o preço de tabela é maior que zero
CREATE TABLE produto (
-- dica: o mesmo tipo do codigo das outras tabelas
codigo INT AUTO_INCREMENT PRIMARY KEY,
-- dica: na figura, a segunda regra ao lado de nome
nome VARCHAR(60) NOT NULL UNIQUE,
-- dica: preço com centavos, como o preco do servico
preco_tabela DECIMAL(6, 2) NOT NULL
CHECK (preco_tabela > 0)
);
-- entregadores
CREATE TABLE entregador (
codigo INT AUTO_INCREMENT PRIMARY KEY,
-- dica: na figura, a regra ao lado de nome
nome VARCHAR(60) NOT NULL
