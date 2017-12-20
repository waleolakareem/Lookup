class Business < ApplicationRecord
  geocoded_by :address
  has_many :reservations
  has_many :users, through: :reservations
end
