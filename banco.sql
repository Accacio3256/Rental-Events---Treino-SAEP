create database rental_db;

create table usuario(
    id serial primary key,
    email varchar(50) not null,
    senha varchar(255) not null,
    username varchar(30) not null
);

create table categoria(
    id serial primary key,
    nome varchar(30) not null
);

create table equipamento(
    id serial primary key,
    nome varchar(50) not null,
    categoria_id int not null,
    marca varchar(50) not null,
    cor varchar(20) not null,
    dimensao varchar(20) not null,
    modelo varchar(20) not null,
    potencia varchar(20) not null,
    material varchar(20) not null,
    peso varchar(20) not null,
    estoque_atual int not null check (estoque_atual >= 0),
    estoque_minimo int not null check (estoque_minimo >= 0),
    foreign key (categoria_id) references categoria(id)
);

create table locacao(
    id serial primary key,
    data_saida date not null,
    usuario_id int not null,
    data_retorno date not null,
    equipamento_id int not null,
    quantidade int not null,
    finalizado boolean not null default false,
    foreign key (usuario_id) references usuario(id),
    foreign key (equipamento_id) references equipamento(id)
);

create table movimentacao(
    id serial primary key,
    data date not null,
    locacao_id int,
    equipamento_id int not null,
    usuario_id int not null,
    tipo varchar(20) not null,
    quantidade int not null,
    foreign key (locacao_id) references locacao(id),
    foreign key (equipamento_id) references equipamento(id),
    foreign key (usuario_id) references usuario(id)
);

insert into usuario (email, senha, username) values
('usuario1@gmail.com', '1234', 'João'),
('usuario2@gmail.com', '12345', 'Saldanha'),
('usuario3@gmail.com', '123456', 'Ricardinho');

insert into categoria (nome) values
('Áudio'),
('Mobiliário'),
('Iluminação');

insert into equipamento (nome, categoria_id, marca, cor, dimensao, modelo, potencia, material, peso, estoque_atual, estoque_minimo) values
('Caixa de Som', 1, 'JBL','Preto','40x30x70 cm','PartyBox 7101','800W','Plástico','27 kg', 10, 3),
('Caixa de Som', 2, 'JBL','Amarelo','40x30x70 cm','PartyBox 7102','800W','Plástico','27 kg', 10, 3),
('Caixa de Som', 3, 'JBL','Azul','40x30x70 cm','PartyBox 7103','800W','Plástico','27 kg', 10, 3);

insert into locacao (data_saida, usuario_id, data_retorno, equipamento_id, quantidade, finalizado) values
('2026-08-20', 1,'2026-08-22', 1, 2, TRUE),
('2026-08-21', 2,'2026-08-27', 2, 6, TRUE),
('2026-09-29', 3,'2026-11-27', 3, 7, TRUE);

insert into movimentacao (data, locacao_id, equipamento_id, usuario_id, tipo, quantidade) values
('2026-08-19', NULL, 1, 1,'entrada', 5),
('2026-08-20', NULL, 2, 2,'entrada', 9),
('2026-08-21', 1, 1, 1,'saída', 1);
