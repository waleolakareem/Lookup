
class User < ApplicationRecord
  validates_email_format_of :email, :message => 'is not looking good'
  has_secure_password
  has_many :reservations
  has_many :businesses, through: :reservations
end

