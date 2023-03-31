--inserir 10 enderecos

insert into endereco (cep, logradouro, numero, cidade, uf) values ('06949504', 'Rua da Saudade', 123, 'Bento Gonçalves', 'RS');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('04543212', 'Travessa das Araras', 43, 'Santo André', 'SP');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('55423122', 'Rua Jandir Moreira', 764, 'Sabará', 'MG');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('70694302', 'Rua Cariri', 542, 'Salvador', 'BA');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('69593111', 'Avenida Cristóvão Martins', 353, 'Rio de Janeiro', 'RJ');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('05940302', 'Rua Charles Miller', 345, 'João Pessoa', 'PB');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('60492033', 'Estrada das Lágrimas', 1844, 'São Caetano do Sul', 'SP');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('59201293', 'Rua Campos Eliseos', 764, 'Natal', 'RN');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('70694302', 'Rua Versalhes', 1331, 'Manaus', 'AM');
insert into endereco (cep, logradouro, numero, cidade, uf) values ('51938120', 'Avenida Marselhesa', 311, 'Araruama', 'RJ');

--inserir 5 clientes

insert into cliente (nome, cpf, id_endereco) values ('Frederico Souza', '40300022211', 3);
insert into cliente (nome, cpf, id_endereco) values ('Janaína Fagundes', '45655533322', 6);
insert into cliente (nome, cpf, id_endereco) values ('Vitor Alario', '33222155500', 2);
insert into cliente (nome, cpf, id_endereco) values ('Armando Mendes', '59744898756', 1);
insert into cliente (nome, cpf, id_endereco) values ('Graça Morais', '30495039212',5);
insert into cliente (nome, cpf, id_endereco) values ('Alipio Jorge', '75254254256', 7);
insert into cliente (nome, cpf, id_endereco) values ('Vanessa Juliana', '40394059301',10);

--inserir 5 produtos

insert into produto (descricao, codigo_barras, valor) values ('Camiseta masculina de algodão e poliéster', 'XJ03910KOAIQ0391', 76.90);
insert into produto (descricao, codigo_barras, valor) values ('Frigideira anti-aderente', 'QE24675RHRWQ76423DQ', 43.50);
insert into produto (descricao, codigo_barras, valor) values ('Microfone dinâmico', 'FB87445KYORW246247', 139.90);
insert into produto (descricao, codigo_barras, valor) values ('Conjunto de meias', 'QO30599OTPRL39530130', 22.90);
insert into produto (descricao, codigo_barras, valor) values ('Caderno 10 Matérias, capa dura', 'HK57256EETHR5456', 14.50);

--inserir carrinhos

insert into carrinho (id_cliente) values (1);
insert into carrinho (id_cliente) values (2);
insert into carrinho (id_cliente) values (3);
insert into carrinho (id_cliente) values (4);
insert into carrinho (id_cliente) values (5);

--inserindo produtos em cada carrinho
--3 no carrinho 1, 1 no carrinho 2, 2 no carrinho 3, 4 no carrinho 4, 1 no carrinho 5

insert into item_carrinho (id_carrinho, id_produto, quantidade) values (1, 3, 5);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (1, 2, 5);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (1, 4, 5);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (2, 1, 2);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (3, 4, 7);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (3, 2, 2);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (4, 5, 1);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (4, 1, 4);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (4, 2, 5);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (4, 3, 2);
insert into item_carrinho (id_carrinho, id_produto, quantidade) values (5, 2, 2);

--inserindo cupons

insert into cupom (data_expiracao, valor, descricao) values ('2023-03-28', 10.00, '10 reais de desconto para compras realizadas das 0h as 6h');
insert into cupom (data_expiracao, valor, descricao) values ('2023-04-01', 30.00, '30 reais de desconto para compras até o dia da mentira (1 de abril)');
insert into cupom (data_expiracao, valor, descricao) values ('2023-05-13', 100.00, '100 reais de desconto para quem adquirir mais de 5 itens no mesmo pedido!');

--inserindo pedidos
--obs: cliente id 3 possui 2 pedidos, restante possui um

insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente, id_cupom) values ('2023-04-01', 'débito', 'enviado', 3, 1);
insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente) values ('2023-04-02', 'pix', 'em processo', 3);
insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente, id_cupom) values ('2023-04-03', 'crédito', 'enviado', 1, 2);
insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente, id_cupom) values ('2023-04-04', 'boleto', 'em processo', 2, 3);
insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente) values ('2023-03-27', 'débito', 'entregue', 4);
insert into pedido (previsao_entrega, meio_pagamento, status, id_cliente) values ('2023-03-28', 'pix', 'enviado', 5);


--INSERINDO ITENS NOS PEDIDOS

-- Pedido 1
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (1, 1, 2, 50.00);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (1, 2, 1, 100.00);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (1, 4, 3, 54.00);

-- Pedido 2
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (2, 2, 3, 65.34);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (2, 3, 2, 76.45);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (2, 4, 5, 231.45);

-- Pedido 3
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (3, 1, 1, 75.31);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (3, 4, 4, 100.34);

-- Pedido 4
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (4, 3, 2, 200.54);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (4, 5, 1, 653.34);

-- Pedido 5
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (5, 2, 2, 34.34);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (5, 4, 3, 65.34);

-- Pedido 6
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (6, 5, 2, 76.34);
insert into item_pedido (id_pedido, id_produto, quantidade, valor) values (6, 1, 1, 451.34);

--inserindo 2 fornecedores

insert into fornecedor (cnpj, nome, id_endereco) values ('20583940000120', 'JSW Vestiário e Moda LTDA', 4);
insert into fornecedor (cnpj, nome, id_endereco) values ('20450943000124', 'Prostylles Utensilios de Cozinha e Itens Variados SA', 8);

--Associando produtos ao fornecedores

insert into item_fornecido (id_fornecedor, id_produto) values (1, 1);
insert into item_fornecido (id_fornecedor, id_produto) values (1, 4);
insert into item_fornecido (id_fornecedor, id_produto) values (2, 2);
insert into item_fornecido (id_fornecedor, id_produto) values (2, 3);
insert into item_fornecido (id_fornecedor, id_produto) values (2, 5);

--2 estoques
insert into estoque (id_endereco) values (9);
insert into estoque (id_endereco) values (10);

--adicionar produtos cadastrados nos estoques criados
insert into item_estoque (id_estoque, id_produto, quantidade) values (1, 1, 1000);
insert into item_estoque (id_estoque, id_produto, quantidade) values (1, 2, 500);
insert into item_estoque (id_estoque, id_produto, quantidade) values (2, 3, 350);
insert into item_estoque (id_estoque, id_produto, quantidade) values (2, 4, 860);
insert into item_estoque (id_estoque, id_produto, quantidade) values (2, 5, 530);












