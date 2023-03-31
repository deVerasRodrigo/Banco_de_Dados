--remoção de clientes sem pedidos ou sem itens no carrinho

delete from cliente where id in (
    select cliente.id as id_cliente
    from cliente 
    left join carrinho on cliente.id = carrinho.id_cliente 
    left join item_carrinho on carrinho.id = item_carrinho.id_carrinho 
    left join pedido on cliente.id = pedido.id_cliente
    group by cliente.id
    having count(distinct pedido.id) = 0 or sum(item_carrinho.quantidade) = 0
);

--atualização da descricao e valor de um produto
update produto set descricao='Conjunto de meias pretas' where codigo_barras ='QO30599OTPRL39530130';
update produto set valor=24.0 where codigo_barras ='QO30599OTPRL39530130';