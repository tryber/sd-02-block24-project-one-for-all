CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(100) NOT NULL,
    idade TINYINT NOT NULL
)ENGINE=InnoDB AUTO_INCREMENT=15;

CREATE TABLE IF NOT EXISTS planos(
    plano_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    plano_nome VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(6, 2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS usuarios_planos (
    usuario_id INT NOT NULL,
    plano_id TINYINT NOT NULL,
    PRIMARY KEY(usuario_id, plano_id),
    CONSTRAINT fk_usuarios_planos_usuarios FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_usuarios_planos_planos FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(100) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(100) NOT NULL,
    artista_id INT,
    CONSTRAINT fk_albuns_artistas FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS musicas(
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_titulo VARCHAR(100) NOT NULL,
    album_id INT,
    CONSTRAINT fk_musicas_albuns FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS historico_usuarios(
    usuario_id INT,
    musica_id INT,
    CONSTRAINT fk_historico_usuarios_usuarios FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_historico_usuarios_musicas FOREIGN KEY (musica_id)
        REFERENCES musicas (musica_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS artistas_seguidores (
    artista_id INT,
    usuario_id INT,
    PRIMARY KEY (artista_id, usuario_id),
    CONSTRAINT fk_artistas_seguidores_artistas FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_artistas_seguidores_usuarios FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB;

INSERT INTO usuarios(usuario_nome, idade)
VALUES
    ('Thati', 23),
    ('Cintia', 35),
    ('Bill', 20),
    ('Roger', 45);

INSERT INTO planos(plano_nome, valor_plano)
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
    
INSERT INTO artistas(artista_nome)
VALUES 
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns(album_nome, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);
    
INSERT INTO musicas(musica_titulo, album_id)
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
    
    