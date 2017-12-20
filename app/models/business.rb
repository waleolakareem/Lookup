# == Schema Information
#
# Table name: businesses
#
#  id           :integer          not null, primary key
#  rating       :integer
#  price        :integer
#  phone        :integer
#  name         :string
#  review_count :integer
#  image_url    :string
#  city         :string
#  country      :string
#  address      :string
#  state        :string
#  zip_code     :integer
#  term         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  location     :string
#  longitude    :string
#  latitude     :string
#  distance     :integer
#

class Business < ApplicationRecord
  geocoded_by :address
  has_many :reservations
  has_many :users, through: :reservations
end
