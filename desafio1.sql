CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
id int primary key auto_increment,
nome_plano varchar(40) not null,
valor_plano decimal(3,2) not null
);

CREATE TABLE usuarios(
id int primary key auto_increment,
nome varchar(100) not null,
idade int not null,
plano_id int not null,
foreign key (plano_id) references planos(id)
);

CREATE TABLE artistas(
id int primary key auto_increment,
nome_artista varchar(100) not null
);

CREATE TABLE albuns(
id int primary key auto_increment,
nome_album varchar(100) not null,
artista_id int not null,
foreign key (artista_id) references artistas(id)
);

CREATE TABLE musicas(
id int primary key auto_increment,
nome_musica varchar(100) not null,
album_id int not null,
foreign key (album_id) references albuns(id)
);

CREATE TABLE usuario_musicas_reproduzidas(
usuario_id int,
musica_id int,
foreign key (usuario_id) references usuarios(id) ON DELETE CASCADE,
foreign key (musica_id) references musicas(id),
primary key (usuario_id, musica_id)
);

CREATE TABLE artista_seguido_pelo_usuario(
usuario_id int,
artista_id int,
foreign key (usuario_id) references usuarios(id) ON DELETE CASCADE,
foreign key (artista_id) references artistas(id),
primary key (usuario_id, artista_id)
);

insert into planos(nome_plano, valor_plano)
values
('gratuito', 0),
('famíliar', 7.99),
('universitário', 5.99);

insert into usuarios(id, nome, idade, plano_id)
values
(15, 'Thati', 23, 1),
(16, 'Cintia', 35, 2),
(17, 'Bill', 20, 3),
(18, 'Roger', 45, 1);

insert into artistas(nome_artista)
values
('Water Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

insert into albuns(nome_album, artista_id)
values
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

insert into musicas(nome_musica, album_id)
values
('Soul for Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Lets Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Lets Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

insert into usuario_musicas_reproduzidas(usuario_id, musica_id)
values
(15, 1),
(15, 6),
(15, 14),
(15, 16),
(16, 13),
(16, 17),
(16, 2),
(16, 15),
(17, 4),
(17, 16),
(17, 6),
(18, 3),
(18, 18),
(18, 11);

insert into artista_seguido_pelo_usuario(usuario_id, artista_id)
values
(15, 1),
(15, 4),
(15, 3),
(16, 1),
(16, 3),
(17, 2),
(17, 1),
(18, 4);
