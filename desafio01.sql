CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS planos(
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(6, 2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS usuarios_planos(
    usuario_id INT NOT NULL,
    plano_id TINYINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (plano_id) REFERENCES planos(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS artistas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS albuns(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS musicas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS historico_usuarios(
    usuario_id INT,
    musica_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (musica_id) REFERENCES musicas(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS artistas_seguidores (
    artista_id INT,
    usuario_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

INSERT INTO usuarios(id, nome, idade)
VALUES
    (15, 'Thati', 23),
    (16, 'Cintia', 35),
    (17, 'Bill', 20),
    (18, 'Roger', 45);

INSERT INTO planos(nome, valor)
VALUES
    ('gratuito', 0),
    ('universitário', 7.99),
    ('familiar', 5.99);
    
INSERT INTO usuarios_planos(usuario_id, plano_id)
VALUES
    (15, 1),
    (16, 3),
    (17, 2),
    (18, 1);

INSERT INTO artistas(nome)
VALUES 
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns(nome, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);
    
INSERT INTO musicas(titulo, album_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ('Sweetie, Let\'s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey,Let\'s Be Silly', 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

INSERT INTO historico_usuarios(usuario_id, musica_id)
VALUES
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

INSERT INTO artistas_seguidores(artista_id, usuario_id)
VALUES
    (1, 15),
    (1, 16),
    (1, 17),
    (2, 17),
    (3, 15),
    (3, 16),
    (4, 15),
    (4, 18);
