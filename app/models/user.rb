require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :email, format: {with: /\w{2,}\@\w+\.\w{2,3}/, message: "please enter a valid email"  }
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 2 } 
  
  def has_secure_password
  
  end

  def authenticate(_password)
   return password == _password
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end