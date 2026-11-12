CREATE USER IF NOT EXISTS 'lanch_expedicao'@'localhost'
  IDENTIFIED BY 'Lanchonete@101';
  CREATE USER IF NOT EXISTS 'Lanch_qualidade'@'localhost'
   IDENTIFIED BY 'Lanchonete@102';
   CREATE USER IF NOT EXISTS 'lanch_gerente'@'localhost'
    IDENTIFIED BY 'Lanchonete@103';
    CREATE USER IF NOT EXISTS 'lanch_admin'@'localhost'
    IDENTIFIED BY 'Lanchonete@104';
    
    GRAN SELECT ON lanchonete.vw_expedicao TO 'lanch_expedicao'@'localhost;
    GRAN SELECT ON lanchonete.log_preco_produto TO 'lanch_qualidade'@'localhost';
    GRAN SELECT ON lanchonete.produto TO 'lanch_qualidade'@'localhost';
    GRAN SELECT, INSERT ON lanchonete.pedido TO 'lanch_gerente'@'localçhost;
    GRAN SELECT, INSERT ON lanchonete.item_pedido TO 'lanch_gerente'@'localhost';
    GRAN SELECT ON lanchonete.estoque TO 'lanch_gerente'@'localhost';
    
    GRANT DELETE ON