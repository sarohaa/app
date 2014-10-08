class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password_confirmation
	validates :email,presence: true
    validates :password,presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
     format: { with: VALID_EMAIL_REGEX },
     uniqueness: { case_sensitive: false }
     validates :username, uniqueness: true
end
