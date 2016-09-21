class Order < ApplicationRecord
  validates :kind, presence: {
      message: "Type can't be empty !!"
  }
  validates :customer_id, presence: {
      message: "Customer can't be empty !!"
  }
  validates :book_id, presence: {
      message: "Book can't be empty !!"
  }

  def allOrder
    ActiveRecord::Base.connection.execute("SELECT orders.id, orders.kind, customers.lastname, customers.firstname, books.name, books.author FROM orders INNER JOIN customers ON customers.id = orders.customer_id INNER JOIN books ON books.id = orders.book_id")
  end
end
