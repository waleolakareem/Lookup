class AddLongitudeToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :longitude, :string
    add_column :businesses, :latitude, :string
  end
end
