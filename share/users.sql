-- $ sqlite3 ./var/user.db < ./share/user.sql

PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS user;
CREATE TABLE user(
    userid INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    username TEXT NOT NULL UNIQUE, 
    pwd BLOB NOT NULL
);

INSERT INTO user VALUES(1,'Akash','Akash@1234');

COMMIT;