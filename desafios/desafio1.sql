CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions(
id INT PRIMARY KEY AUTO_INCREMENT,
subs_name VARCHAR(50) NOT NULL,
price DECIMAL(5,2) NOT NULL
);

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
subscription INT NOT NULL,
FOREIGN KEY (subscription) REFERENCES subscriptions(id)
);

create table artists(
id int primary key auto_increment,
artist_name varchar(100) not null
);

create table user_follows(
user_id int not null,
artist_id int not null,
primary key (user_id, artist_id)
);

create table albums(
id int primary key auto_increment,
album_name varchar(100) not null,
artist_id int not null,
foreign key (artist_id) references artists(id)
);

create table songs(
id int primary key auto_increment,
song_name varchar(100) not null,
album_id int not null,
foreign key (album_id) references albums(id)
);

create table last_played(
user_id int not null,
song_id int not null,
foreign key (user_id) references users(id),
foreign key (song_id) references songs(id)
);

-- drop schema SpotifyClone;

insert into subscriptions (subs_name, price)
values
('Gratuito',	0),
('Familiar' , 7.99),
('Universitário', 5.99);

insert into users (id, user_name, age, subscription)
values
(15, 'Thati', 23, 1),
(16, 'Cintia', 35, 2),
(17, 'Bill', 20, 3),
(18, 'Roger', 45, 1);

insert into artists (artist_name)
values
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

insert into albums (album_name, artist_id)
values
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incadescent', 3),
('Temporary Culture', 4);

insert into user_follows(user_id, artist_id)
values
(15, 1),
(15, 4),
(15, 3),
(16, 1),
(16, 3),
(17, 2),
(17, 1),
(18, 4);

insert into songs(song_name, album_id)
values
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let`s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let`s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

insert into last_played (user_id, song_id)
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
