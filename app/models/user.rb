class User < ApplicationRecord
  before_save :bcryptPass
  after_save :clearPass

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
  validates_length_of :pass, :in => 5..20, :on => :create

  def bcryptPass
    if pass.present?
      self.pass= BCrypt::Password.create(pass)
    end
  end
  def clearPass
    self.pass = nil
  end
end