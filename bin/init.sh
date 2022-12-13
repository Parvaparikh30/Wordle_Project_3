#!/bin/sh

echo "Initializing databases..."
echo "Initializing games.db..."
sqlite3 ./var/primary/mount/games.db < ./share/games.sql
echo "Initializing users.db..."
sqlite3 ./var/users.db < ./share/users.sql

echo "Populating Database....."
python3 ./bin/init_db.py
echo "Finished Initialization and Population."

exit