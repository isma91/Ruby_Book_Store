class Log < ApplicationRecord
  def logLogin
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname, users.firstname FROM logs INNER JOIN users ON users.id = logs.user_id WHERE logs.action = 'login'")
  end

  def logLogout
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname, users.firstname FROM logs INNER JOIN users ON users.id = logs.user_id WHERE logs.action = 'logout'")
  end

  def logBook
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname, users.firstname, books.name, books.author FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN books ON books.id = logs.book_id WHERE logs.action = 'add book'")
  end

  def logBookEdit
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname, users.firstname, books.name, books.author FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN books ON books.id = logs.book_id WHERE logs.action = 'edit book'")
  end

  def logCustomer
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname AS 'userLastname', users.firstname AS 'userFirstname', customers.lastname AS 'customerLastname', customers.firstname AS 'customerFirstname' FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN customers ON customers.id = logs.customer_id WHERE logs.action = 'add customer'")
  end

  def logCustomerEdit
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname AS 'userLastname', users.firstname AS 'userFirstname', customers.lastname AS 'customerLastname', customers.firstname AS 'customerFirstname' FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN customers ON customers.id = logs.customer_id WHERE logs.action = 'edit customer'")
  end

  def logOrder
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname AS 'userLastname', users.firstname AS 'userFirstname', customers.lastname AS 'customerLastname', customers.firstname AS 'customerFirstname', books.name, books.author, orders.kind FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN orders ON orders.id = logs.order_id INNER JOIN books ON books.id = orders.book_id INNER JOIN customers ON customers.id = orders.customer_id  WHERE logs.action = 'add order'")
  end

  def logOrderEdit
    ActiveRecord::Base.connection.execute("SELECT logs.date, users.lastname AS 'userLastname', users.firstname AS 'userFirstname', customers.lastname AS 'customerLastname', customers.firstname AS 'customerFirstname', books.name, books.author, orders.kind FROM logs INNER JOIN users ON users.id = logs.user_id INNER JOIN orders ON orders.id = logs.order_id INNER JOIN books ON books.id = orders.book_id INNER JOIN customers ON customers.id = orders.customer_id  WHERE logs.action = 'edit order'")
  end
end
