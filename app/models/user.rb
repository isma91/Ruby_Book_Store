class User < ApplicationRecord
  validates :lastname, presence: {
      message: "Lastname can't be empty !!"
  }
  validates :firstname, presence: {
      message: "Firstname can't be empty !!"
  }
  validates :email, uniqueness: {
      message: "Email already taken !!"
  }
  validates :pass, presence: {
      message: "Pass can't be empty !!"
  }
end