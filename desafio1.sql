DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    valor DOUBLE
) engine = InnoDB;

CREATE TABLE usuarios(
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES planos(id)
) engine = InnoDB;

CREATE TABLE artistas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE cancoes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albuns(id)
) engine = InnoDB;

CREATE TABLE historico_reproducao(
    usuario_id INT,
    cancao_id INT,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(id)
) engine = InnoDB;

CREATE TABLE seguindo_artista(
    usuario_id INT,
    artista_id INT,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
) engine = InnoDB;

INSERT INTO planos (nome, valor)
VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO usuarios (id, nome, idade, plano_id)
VALUES
    (15, 'Thati', 23, 1),
    (16, 'Cintia', 35, 2),
    (17, 'Bill', 20, 3),
    (18, 'Roger', 45, 1);

INSERT INTO artistas (nome)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns (nome, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancoes (nome, album_id)
VALUES
    ('Soul For Us', 1),
    ('Magic Circus', 3),
    ('Diamond Power', 4),
    ('Thang Of Thunder', 5),
    ('Home Forever', 4),
    ('Words Of Her Life', 5),
    ('Reflections Of Magic', 1),
    ('Honey, Let''s Be Silly', 4),
    ('Troubles Of My Inner Fire', 2),
    ('Dance With Her Own', 1),
    ('Without My Streets', 5),
    ('Celebration Of More', 4),
    ('Time Fireworks', 2),
    ('Honey, So Do I', 3),
    ('Sweetie, Let''s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Rock His Everything', 4);

INSERT INTO historico_reproducao (usuario_id, cancao_id)
VALUES
    (15, 1),
    (15, 2),
    (15, 3),
    (15, 4),
    (16, 5),
    (16, 6),
    (16, 7),
    (16, 8),
    (17, 9),
    (17, 4),
    (17, 2),
    (18, 10),
    (18, 11),
    (18, 12);

INSERT INTO seguindo_artista (usuario_id, artista_id)
VALUES
    (15, 1),
    (15, 4),
    (15, 3),
    (16, 1),
    (16, 3),
    (17, 2),
    (17, 1),
    (18, 4);
