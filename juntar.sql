SELECT * FROM fornecedor INNER JOIN compra ON compra.fornecedor = fornecedor.CPF_CNPJ;
SELECT * FROM compra INNER JOIN produto ON compra.codigo_compra = produto.codigo;
SELECT * FROM produto INNER JOIN venda ON venda.codigo_venda = produto.codigo;
SELECT * FROM venda INNER JOIN cliente ON venda.cliente = cliente.CPF_CNPJ;
SELECT * FROM cliente LEFT JOIN dados_saude ON cliente.CPF_CNPJ = dados_saude.CPF_CLIENTE;
SELECT * FROM produto FULL OUTER JOIN venda ON produto.codigo = venda.codigo_venda FULL OUTER JOIN cliente ON venda.cliente = cliente.CPF_CNPJ;