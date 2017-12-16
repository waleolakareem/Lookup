class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :businesses, through: :reservations
end
# This file is used by Rack-based servers to start the application.
# config.ru
# require_relative 'config/environment'

# run Rails.application
