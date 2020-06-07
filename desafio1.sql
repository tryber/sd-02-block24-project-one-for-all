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

create table musics (
id int primary key auto_increment,
music varchar(50) not null
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

insert into plans (plan, price) value
('gratuito', 0),
('familiar', 7.99),
('universitario', 5.99);

insert into users (user, age, plan_id) value
('Thati', 23, 15),
('Cintia', 35, 16),
('Bill', 20, 17),
('Roger', 45, 18);

insert into musics (music) value
('Soul For Us'),
('Magic Circus'),
('Diamond Power'),
('Thang Of Thunder'),
('Home Forever'),
('Words Of Her Life'),
('Refletions Of Magic'),
('Honey, Lets Be Silly'),
('Troubles Of my Inner Fire'),
('Dance With Her Own'),
('Without My Streets'),
('Celebration Of More'),
('Time Fireworks'),
('Honey, So Do I'),
('Sweetie, Lets Go Wild'),
('She Knows'),
('Fantasy For Me'),
('Rock His Everything');

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
