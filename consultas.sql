use banco_livraria;

-- Total gasto por cliente --
select c.nome as clientes,
concat('R$ ', format(sum(l.preco * ic.quantidade), 2, 'de_DE')) as total_gasto
from clientes c
join compra co on c.id_cliente = co.id_cliente
join itens_compra ic on co.id_compra = ic.id_compra
join livro l on ic.id_livro = l.id_livro
group by c.nome
order by sum(l.preco * ic.quantidade) desc;

-- Autor mais vendido --
select 
    a.nome_autor as autor,
    sum(ic.quantidade) as total_vendido
from autores a
join livro l on a.id_autor = l.id_autor
join itens_compra ic on l.id_livro = ic.id_livro
group by a.nome_autor
order by total_vendido desc
limit 1;

-- Percentual de gêneros mais vendidos --
select l.genero as genero,
       round((sum(ic.quantidade) * 100.0 / 
              (select sum(quantidade) from itens_compra)), 2) as percentual_vendas
from livro l
join itens_compra ic on l.id_livro = ic.id_livro
group by l.genero
order by percentual_vendas desc;

-- Livros comprados por cada cliente --
select c.nome as clientes, 
l.titulo as livro, 
l.genero as genero,
concat('R$ ', format(l.preco, 2, 'de_DE')) as preco
from clientes c
join compra co on c.id_cliente = co.id_cliente
join itens_compra ic on co.id_compra = ic.id_compra
join livro l on ic.id_livro = l.id_livro
order by c.nome;

-- Autor mais procurado --
select a.nome_autor as autor, 
       count(distinct co.id_compra) as Compra
from autores a
join livro l on a.id_autor = l.id_autor
join itens_compra ic on l.id_livro = ic.id_livro
join compra co on ic.id_compra = co.id_compra
group by a.nome_autor
order by Compra desc
limit 1;
