class Customer < ApplicationRecord
  validates :lastname, presence: {
      message: "Lastname can't be empty !!"
  }
  validates :firstname, presence: {
      message: "Firstname can't be empty !!"
  }
  validates :email, uniqueness: {
      message: "Email already taken !!"
  }
  validates :adresse, presence: {
      message: "Adresse can't be empty !!"
  }
  validates :city, presence: {
      message: "City can't be empty !!"
  }
end
