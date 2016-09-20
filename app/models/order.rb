class Order < ApplicationRecord
  validates :kind, presence: {
      message: "Type can't be empty !!"
  }
  validates :idCustomer, presence: {
      message: "Customer can't be empty !!"
  }
  validates :idBook, presence: {
      message: "Book can't be empty !!"
  }
end
