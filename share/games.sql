-- $ sqlite3 ./var/primary/mount/game.db < ./share/game.sql
PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS valid_words;
DROP TABLE IF EXISTS secret_word;
DROP TABLE IF EXISTS guesses;
DROP TABLE IF EXISTS games;

CREATE TABLE games (
    gameid TEXT NOT NULL PRIMARY KEY,
    username TEXT NOT NULL,
    secretWord TEXT NOT NULL,
    isActive INTEGER DEFAULT 1 NOT NULL,
    hasWon INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE guesses (
    guessid INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    gameid TEXT NOT NULL,
    guess TEXT NOT NULL,
    UNIQUE(gameid, guess),
    FOREIGN KEY(gameid) REFERENCES games(gameid)
);

CREATE TABLE secret_word (
    word TEXT PRIMARY KEY
);

CREATE TABLE valid_words (
    word TEXT PRIMARY KEY
);

CREATE INDEX games_id_index ON games (
    username,
    isActive
);

COMMIT;

