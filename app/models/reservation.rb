# == Schema Information
#
# Table name: reservations
#
#  id               :integer          not null, primary key
#  start_time       :datetime
#  date             :date
#  name_of_reserver :string
#  number_of_seat   :integer
#  business_id      :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :business
end
