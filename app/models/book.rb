class Book < ApplicationRecord
  validates :name, presence: {
      message: "Name can't be empty !!"
  }
  validates :author, presence: {
      message: "Author can't be empty !!"
  }
  validates :year, presence: {
      message: "Year can't be empty !!"
  }
  validates :kind, presence: {
      message: "Kind can't be empty !!"
  }
  validates :cover, presence: {
      message: "Cover can't be empty !!"
  }
  validates :Resume, presence: {
      message: "Resume can't be empty !!"
  }
end
