class User < ActiveRecord::Base
  before_save{ email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format:{ with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 6 }

  #gives us the ability to store a securely hashed password_digest attribute to the database
  ###What is a password_digest attribute? password_digest is a column in your model that will hold the encrypted version of the password

  #a pair of virtual attributes (password and password_confirmation) including presence validations upon object creation and a validation requiring that they match

  #an authenticate method that returns the user when the password is correct and false otherwise
end

