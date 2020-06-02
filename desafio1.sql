DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT PRIMARY KEY auto_increment,
    plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    plano VARCHAR(50) NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;


CREATE TABLE usuarios_planos(
    usuario_id INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;
CREATE TABLE artistas(
    artista_id INT PRIMARY KEY auto_increment,
    artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT PRIMARY KEY auto_increment,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    artista VARCHAR(50) NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY auto_increment,
    cancao VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE usuarios_artistas(
    usuario_id INT NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    seguindo_artista VARCHAR(50) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE usuarios_historico_reproducao(
    usuario_id INT NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    historico_reproducao VARCHAR(50) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO planos(plano, valor_plano)
    VALUES ("gratuito", 0),
            ("familiar", 7.99),
            ("universitário", 5.99);       

INSERT INTO usuarios(usuario_id, usuario, idade, plano_id, plano)
        VALUES (15, "Thati", 23, 1, "gratuito"),
            (16, "Cintia", 35, 2, "familiar"),
            (17, "Bill", 20, 3, "universitário"),
            (18, "Roger", 45, 1, "gratuito");
            
INSERT INTO usuarios_planos(usuario_id, plano_id)
    VALUES (15, 1),
        (16, 2),
        (17, 3),
        (18, 1);
              
INSERT INTO artistas(artista)
    VALUES ("Walter Phoenix"),
            ("Peter Strong"),
            ("Lance Day"),
            ("Freedie Shannon");

            
INSERT INTO albuns(album, artista_id, artista)
    VALUES ("Envious", 1, "Walter Phoenix"),
        ("Exuberant", 1, "Walter Phoenix"),
        ("Hallowed Steam", 2, "Peter Strong"),
        ("Incandescent", 3, "Lance Day"),
        ("Temporary Culture", 4, "Freedie Shannon");
            
INSERT INTO usuarios_artistas(usuario_id, usuario, artista_id, seguindo_artista)
        VALUES (15, "Thati", 1, "Walter Phoenix"),
              (15, "Thati", 4, "Freedie Shannon"),
              (15, "Thati", 3, "Lance Day"),
              (16, "Cintia", 1, "Walter Phoenix"),
              (16, "Cintia", 3, "Lance Day"),
              (17, "Bill", 1, "Walter Phoenix"),
              (17, "Bill", 2, "Peter Strong"),
              (18, "Roger", 4, "Freedie Shannon");
              
INSERT INTO cancoes(cancao, album_id)
    VALUES ("Soul For US", 1),
            ("Magic Circus", 3),
            ("Diamond Power", 4),
            ("Thang of Thunder", 5),
            ("Home Forever", 4),
            ("Words Of Her Life", 5),
            ("Reflections Of Magic", 1),
            ("Honey,Let's Be Silly", 4),
            ("Troubles Of My Inner Fire", 2),
            ("Dance With Her Own", 1),
            ("Without My Streets", 5),
            ("Celebration Of More", 4),
            ("Time Frameworks", 2),
            ("Honey, So Do I", 3),
            ("Sweetie, Let's go Wild", 3),
            ("She Knows", 3),
            ("Fantasy For Me", 4),
            ("Rock His Everything", 4);
            
INSERT INTO usuarios_historico_reproducao(usuario_id, usuario, historico_reproducao)
        VALUES (15, "Thati", "Soul For Us"),
            (15, "Thati", "Magic Circus"),
            (15, "Thati", "Diamond Power"),
            (15, "Thati", "Thang Of Thunder"),
            (16, "Cintia", "Home Forever"),
            (16, "Cintia", "Words Of Her Life"),
            (16, "Cintia", "Reflections Of Magic"),
            (16, "Cintia", "Honey,Let's Be Silly"),
            (17, "Bill", "Troubles Of My Inner Fire"),
            (17, "Bill", "Thang Of Thunder"),
            (17, "Bill", "Magic Circus"),
            (18, "Roger", "Dance With Her Own"),
            (18, "Roger", "Without My Streets"),
            (18, "Roger", "Celebration Of More");
               
