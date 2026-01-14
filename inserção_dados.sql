use banco_livraria;

-- Inserção dos dados --
insert into clientes (nome, email) values
('Ana Almeida', 'ana.a@gmail.com'),
('Bruno Souza', 'bruno.s@gmail.com'),
('Carlos Alves', 'carlos.al@gmail.com'),
('Daniela Oliveira', 'dani.o@gmail.com'),
('Eduarda Santos', 'dudaa@gmail.com'),
('Fatima Silva', 'fatimaa@gmail.com');

insert into autores (nome_autor, nacionalidade) values
('Colleen Hoover', 'EUA'),
('Sarah J. Maas', 'EUA'),
('Rebecca Yarros', 'EUA'),
('C.S.Lewis', 'Britânico'),
('J.K. Rowling', 'Reino Unido'),
('Stephen King', 'EUA'),
('Ana Huang', 'EUA'),
('Elena Armas', 'espanhola'),
('Machado de Asis', 'BR'),
('Clarice Lispector', 'BR'),
('Pedro Bandeira', 'BR'),
('Edgar Allan Poe', 'EUA');

insert into livro (titulo, id_autor, preco, genero) values
('O lado feio do amor', 1, 35.90, 'Romance'),
('Se não fosse você', 1, 40.99, 'Romance'),
('Novembro 9', 1, 26.50, 'Romance'),
('Corte de espinhos e Rosas', 2, 55.00, 'Fantasia'),
('Quarta Asa', 3, 48.99, 'Fantasia'),
('Cristianismo puro e simples', 4, 58.99, 'Religioso'),
('Os quatro amores', 4, 45.50, 'Religioso'),
('Harry Potter', 5, 55.90, 'Fantasia'),
('It A coisa', 6, 75.90, 'Terror'),
('Amor e ódio', 7, 25.30, 'Romance'),
('Amor em jogo', 8, 30.00, 'Romance'),
('Dom Casmurro', 9, 24.99, 'Romance'),
('Água Viva', 10, 63.99, 'Ficção'),
('A droga da obediência', 11, 35.50, 'Ficção'),
('A Queda da Casa de Usher', 12, 25.00, 'Terror'),
('O corvo', 12, 40.50, 'Terror');

insert into compra (id_cliente, data_compra) values
('1', '2025-11-05'),
('2', '2025-11-07'),
('3', '2025-11-04'),
('4', '2025-11-03'),
('5', '2025-11-02'),
('6', '2025-11-01');

insert into itens_compra (id_compra, id_livro, quantidade) values
(1,12,5),
(2,3,2),
(3,8,1),
(4,2,2),
(5,1,3),
(6,5,4);
