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
end
