run:
  @ ./run/script.sh

init:
  @ sqlite3 movies.db < ./sql/create_table.sql

read:
  @ sqlite3 movies.db < ./sql/select_values.sql
