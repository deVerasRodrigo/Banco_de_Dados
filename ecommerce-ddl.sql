create table produto (
	id serial primary key,
	descricao text not null,
	codigo_barras varchar(44) unique not null,
	valor numeric not null
);

create table endereco(
	id serial,
	cep char(8) not null,
	logradouro varchar(100) not null,
	numero int check (numero > 0),
	cidade varchar(200) not null,
	uf char(2) not null,
	primary key(id)
);

create table cliente(
	id serial primary key,
	nome varchar(255) not null,
	cpf char(11) unique not null,
	id_endereco int not null,
	foreign key(id_endereco) references endereco(id)
);

create table cupom (
	id serial primary key,
	data_expiracao date not null,
	data_inicio timestamp not null default CURRENT_TIMESTAMP,
	valor numeric not null,
	descricao text not null
);

create table cupom_cliente(
	id_cupom int not null,
	id_cliente int not null,
	primary key(id_cupom, id_cliente),
	foreign key(id_cupom) references cupom(id),
	foreign key(id_cliente) references cliente(id)
	
);

create table pedido(
	id serial primary key,
	previsao_entrega date not null,
	meio_pagamento varchar(200) not null check (meio_pagamento in ('débito', 'crédito', 'boleto', 'pix')),
	status varchar(100) not null check (status in ('enviado', 'entregue', 'em processo', 'devolvido')),
	id_cliente int not null,
	data_criacao timestamp not null default CURRENT_TIMESTAMP,
	id_cupom int,
	foreign key(id_cliente) references cliente(id),
	foreign key(id_cupom) references cupom(id)
);

create table item_pedido(
	id_pedido int not null,
	id_produto int not null,
	quantidade int not null,
	valor numeric not null,
	primary key(id_pedido, id_produto),
	foreign key(id_pedido) references pedido(id),
	foreign key(id_produto) references produto(id)
);

create table carrinho(
	id serial primary key,
	id_cliente int unique not null,
	foreign key(id_cliente) references cliente(id)
);

create table item_carrinho(
	id_carrinho int not null,
	id_produto int not null,
	quantidade int not null,
	data_insercao date not null default CURRENT_DATE,
	primary key(id_carrinho, id_produto),
	foreign key(id_carrinho) references carrinho(id),
	foreign key(id_produto) references produto(id)
);

create table estoque(
	id serial primary key,
	id_endereco int not null,
	foreign key(id_endereco) references endereco(id)
);

create table item_estoque(
	id_estoque int not null,
	id_produto int not null,
	quantidade int not null,
	primary key(id_estoque, id_produto),
	foreign key(id_estoque) references estoque(id),
	foreign key(id_produto) references produto(id)
);


create table fornecedor(
	id serial primary key,
	cnpj char(14) unique not null,
	nome varchar(255) not null,
	id_endereco int unique not null,
	foreign key(id_endereco) references endereco(id)
);

create table item_fornecido(
	id_fornecedor int not null,
	id_produto int not null,
	primary key(id_fornecedor, id_produto),
	foreign key(id_fornecedor) references fornecedor(id),
	foreign key(id_produto) references produto(id)
);