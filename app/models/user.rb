class User < ApplicationRecord 
    has_many :people
  has_many :addresses
  has_many :emails
  has_many :phone_numbers
    # method that works with the password_digest column & password & password confirmation
  has_secure_password

  validates :email, format: { with: /@/, message: "Must have an @" }
end 