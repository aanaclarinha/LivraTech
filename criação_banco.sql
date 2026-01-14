-- Criar banco
create database if not exists banco_livraria;
use banco_livraria;

-- Tabela de clientes
create table clientes (
    id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null
);

-- Tabela de autores
create table autores (
    id_autor int auto_increment primary key,
    nome_autor varchar(100) not null,
    nacionalidade varchar(50)
);

-- Tabela de livros (ATUALIZADA)
create table livro (
    id_livro int auto_increment primary key,
    titulo varchar(200) not null,
    id_autor int not null,
    preco decimal(10,2) not null,
    genero varchar(50),
    foreign key (id_autor) references autores(id_autor)
        on delete cascade
        on update cascade
);

-- Tabela de compra
create table compra (
    id_compra int auto_increment primary key,
    id_cliente int not null,
    data_compra timestamp default current_timestamp,
    foreign key (id_cliente) references clientes(id_cliente)
        on delete cascade
        on update cascade
);

-- Tabela de itens da compra
create table itens_compra (
    id_item int auto_increment primary key,
    id_compra int not null,
    id_livro int not null,
    quantidade int not null,
    foreign key (id_compra) references compra(id_compra)
        on delete cascade
        on update cascade,
    foreign key (id_livro) references livro(id_livro)
        on delete cascade
        on update cascade
);
