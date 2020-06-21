create database if not exists SpotifyClone;
use SpotifyClone;

create table plans (
id int primary key auto_increment,
plan varchar(50) not null,
price double
) engine=InnoDB;

create table users (
id int primary key auto_increment,
user varchar(50) not null,
age int not null,
plan_id int,
foreign key (plan_id) references plans(id)
) engine=InnoDB;

create table artists (
id int primary key auto_increment,
artist varchar(50) not null
) engine=InnoDB;

create table albums (
id int primary key auto_increment,
album varchar(50) not null,
artist_id int,
foreign key (artist_id) references artists(id)
) engine=InnoDB;

create table musics (
id int primary key auto_increment,
music varchar(50) not null,
album_id int,
foreign key (album_id) references albums(id)
) engine=InnoDB;

create table reproduction_history (
id int primary key auto_increment,
user_id int,
foreign key (user_id) references users(id),
music_id int,
foreign key (music_id) references musics(id)
);

create table users_follow_artist (
id int primary key auto_increment,
user_id int,
foreign key (user_id) references users(id),
artist_id int,
foreign key (artist_id) references artists(id)
);

insert into plans (id, plan, price) value
(15, 'gratuito', 0),
(16, 'familiar', 7.99),
(17, 'universitario', 5.99);

insert into users (user, age, plan_id) value
('Thati', 23, 15),
('Cintia', 35, 16),
('Bill', 20, 17),
('Roger', 45, 15);

insert into artists (artist) value
('Walter Phoenix'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong');

insert into albums (album, artist_id) value
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 4),
('Incandescent', 3),
('Temporary Culture', 2);

insert into musics (music, album_id) value
('Soul For Us', 1),
('Magic Circus', 3),
('Diamond Power', 4),
('Thang Of Thunder', 5),
('Home Forever', 4),
('Words Of Her Life', 5),
('Refletions Of Magic', 1),
('Honey, Lets Be Silly', 4),
('Troubles Of my Inner Fire', 2),
('Dance With Her Own', 1),
('Without My Streets', 5),
('Celebration Of More', 4),
('Time Fireworks', 2),
('Honey, So Do I', 3),
('Sweetie, Lets Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Rock His Everything', 4);

insert into reproduction_history (user_id, music_id) value
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 5), (2, 6), (2, 7), (2, 8),
(3, 9), (3, 4), (3, 2),
(4, 10), (4, 11), (4, 12);

insert into users_follow_artist (user_id, artist_id) value
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 3),
(3, 4), (3, 1),
(4, 2);
