-- 1
select * from cliente c where c.nome like 'Ana %';

-- 2
select * from pedido p where p.data_criacao >= '2023-01-01' and p.data_criacao < '2024-01-01';

-- 3
select * from pedido p where extract(month from p.data_criacao) = 01;

-- 4
select * from item_pedido i where i.valor >= 2 and i.valor <= 5;

-- 5
select max(item_pedido.valor) as item_mais_caro from item_pedido;

-- 6
select distinct pedido.status from pedido;

-- 7
select max(p.valor) as maior_valor, min(p.valor) as menor_valor, avg(p.valor) as valor_medio
from produto p inner join item_estoque i on p.id = i.id_produto;

-- 8
select f.nome, f.cnpj, e.logradouro, e.numero, e.cidade, e.uf 
from fornecedor f inner join endereco e on f.id_endereco = e.id;

-- 9
select e.id, p.descricao, ie.quantidade, 
en.logradouro, en.numero, en.cidade, en.uf
from produto p
inner join item_estoque ie on p.id = ie.id_produto
inner join estoque e on e.id = ie.id_estoque 
inner join endereco en on en.id = e.id_endereco;

-- 10
select p.descricao, p.codigo_barras, ie.quantidade from item_estoque ie 
inner join estoque e on ie.id_estoque = e.id
inner join produto p on ie.id_produto = p.id;

-- 11
select p.descricao, ic.quantidade, p.valor from cliente c 
inner join item_carrinho ic on ic.id_cliente = c.id
inner join produto p on p.id = ic.id_produto
where c.cpf = '26382080861';

-- 12
select c.id, c.nome, c.cpf, count(distinct ic.id_produto) as quant_prod_diferentes
from cliente c 
inner join item_carrinho ic on ic.id_cliente = c.id 
inner join produto p on p.id = ic.id_produto
group by c.id
order by count(ic.id_produto) desc;

-- 13
select item_carrinho.id_produto, produto.descricao, item_carrinho.data_insercao, item_carrinho.id_cliente, cliente.nome
from item_carrinho
join produto on item_carrinho.id_produto = produto.id 
join cliente on item_carrinho.id_cliente = cliente.id 
where item_carrinho.data_insercao < date_trunc('month', current_date - interval '10 months')
order by item_carrinho.data_insercao;

-- 14
select endereco.uf, count(distinct cliente.id) as n_clientes
from cliente
join endereco on cliente.id_endereco = endereco.id
group by endereco.uf
order by n_clientes desc;

-- 15
select endereco.cidade, count(distinct cliente.id) as n_clientes
from cliente
join endereco on cliente.id_endereco = endereco.id
group by endereco.cidade 
having count(distinct cliente.id) = (
	select count(distinct cliente.id) as n_clientes
	from cliente
	join endereco on cliente.id_endereco = endereco.id 
	group by endereco.cidade
	order by n_clientes desc
	limit 1
);

-- 16
select cliente.nome, pedido.id, pedido.previsao_entrega,
pedido.status, produto.descricao, item_carrinho.quantidade,
item_carrinho.quantidade * produto.valor as valor_total_pago
from cliente
join pedido on cliente.id = pedido.id_cliente 
join item_carrinho on cliente.id = item_carrinho.id_cliente 
join produto on item_carrinho.id_produto = produto.id
where pedido.id = 952;

-- 17
select cliente.id, cliente.nome, max(pedido.data_criacao) as data_ultima_compra_2022
from cliente
join pedido on cliente.id = pedido.id_cliente
where pedido.data_criacao between '2022-01-01' and '2022-12-31'
group by cliente.id, cliente.nome
order by data_ultima_compra_2022;

-- 18
select cliente.nome, sum(item_carrinho.quantidade * produto.valor) as valor_total_gasto
from cliente
join pedido on cliente.id = pedido.id_cliente
join item_carrinho on cliente.id = item_carrinho.id_cliente 
join produto on item_carrinho.id_produto = produto.id 
where date_part('year', pedido.data_criacao) = 2023
group by cliente.id, cliente.nome
order by valor_total_gasto desc limit 10;

-- 19
select produto.descricao, sum(item_carrinho.quantidade) as qtd_vendida,
sum(item_carrinho.quantidade*produto.valor) as valor_total_vendas
from produto
join item_carrinho on item_carrinho.id_produto = produto.id 
where date_part('year', item_carrinho.data_insercao) = 2023
group by produto.descricao
order by valor_total_vendas desc limit 10;

-- 20
select ((sum(ip.quantidade * ip.valor)-sum(cp.valor))/count(ped.id)) as ticket_medio from pedido ped
	inner join item_pedido ip  on ped.id = ip.id_pedido
	left join cupom cp on cp.id = ped.id_cupom 
	where ped.status='SUCESSO';

-- 21
select cl.id id_cliente, cl.nome, max(valor_pedido) valor_maximo_gasto
	from (select ip.id_pedido, sum(ip.quantidade * ip.valor) as valor_pedido from item_pedido ip
			group by ip.id_pedido) as valor_pedido
		inner join pedido ped on ped.id = valor_pedido.id_pedido
		inner join cliente cl on ped.id_cliente = cl.id
		where valor_pedido > 10000
		group by cl.id;
		
-- 22
select c.descricao, p.id_cupom, count(p.id_cupom) quantitade_utilizada, sum(c.valor) valor_total_descontado from cupom c 
	inner join pedido p on p.id_cupom = c.id
	group by p.id_cupom, c.descricao
	order by quantitade_utilizada desc limit 10;

-- 23
select c.descricao, p.id_cupom, count(p.id_cupom) quantitade_utilizada, c.limite_maximo_usos from cupom c
	inner join pedido p on p.id_cupom = c.id
	group by p.id_cupom, c.descricao, c.limite_maximo_usos
	having count(p.id_cupom) > c.limite_maximo_usos 
	order by quantitade_utilizada;

-- 24
select ped.id id_pedido, p.codigo_barras, c.id id_cliente, e.uf uf_cliente from item_pedido ip
	inner join produto p on ip.id_produto = p.id
	inner join pedido ped on ped.id = id_pedido
	inner join cliente c on ped.id_cliente = c.id 
	inner join endereco e on c.id_endereco = e.id 
	where p.codigo_barras = '97692630963921' and e.uf = 'SP';