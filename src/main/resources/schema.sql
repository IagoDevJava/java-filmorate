CREATE TABLE IF NOT EXISTS MPA
(
    ID   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    NAME CHARACTER VARYING
);

create table IF NOT EXISTS USERS
(
    ID       INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    NAME     CHARACTER VARYING,
    LOGIN    CHARACTER VARYING not null,
    EMAIL    CHARACTER VARYING,
    BIRTHDAY DATE
);

create table IF NOT EXISTS FILM
(
    ID           INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    NAME         CHARACTER VARYING,
    DESCRIPTION  CHARACTER VARYING,
    RELEASE_DATE DATE,
    DURATION     INTEGER,
    RATE         CHARACTER VARYING,
    MPA          INTEGER REFERENCES MPA (ID)
);

CREATE TABLE IF NOT EXISTS GENRE
(
    ID   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY UNIQUE,
    NAME CHARACTER VARYING UNIQUE
);

CREATE TABLE IF NOT EXISTS FILM_GENRE
(
    FILM_ID  INTEGER NOT NULL REFERENCES FILM (ID),
    GENRE_ID INTEGER NOT NULL REFERENCES GENRE (ID)
);

CREATE TABLE IF NOT EXISTS LIKES
(
    FILM_ID INTEGER NOT NULL REFERENCES FILM (ID),
    USER_ID INTEGER NOT NULL REFERENCES USERS (ID)
);

CREATE TABLE IF NOT EXISTS FRIENDSHIP
(
    USER_ID   INTEGER NOT NULL REFERENCES USERS (ID),
    FRIEND_ID INTEGER NOT NULL REFERENCES USERS (ID)
);

INSERT INTO MPA (NAME)
VALUES ('G'),
       ('PG'),
       ('PG-13'),
       ('R'),
       ('NC-17');

INSERT INTO GENRE (NAME)
VALUES ('Комедия'),
       ('Драма'),
       ('Мультфильм'),
       ('Триллер'),
       ('Документальный'),
       ('Боевик');