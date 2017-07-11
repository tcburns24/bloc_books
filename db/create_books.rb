require 'sqlite3'
require 'pry'

db = SQLite3::Database.new("db/db.sqlite")
binding.pry
db.execute <<-SQL
  CREATE TABLE book (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30),
    author VARCHAR(30),
    pages INTEGER
  );
SQL
