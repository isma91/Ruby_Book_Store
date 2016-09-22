#Ruby_Book_Store
##A personal bookstore in Ruby
###How to use ?
First, you need to create the sqlite database with  
```
rake db:create
```
This command should reate 2 database: `test.sqlite3` and `development.sqlite3`, delete the `test.sqlite3`  
After that you should run with
```
rails server
```
And go to your personal browser with `localhost:3000`
