class User < ApplicationRecord
  def findByEmail(searchedEmail)
    userToFind = false
    User.all.each do |user|
      if user.email == searchedEmail
        userToFind = user
        break
      end
    end
    userToFind
  end
end
