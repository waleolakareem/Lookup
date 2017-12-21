class ChangeLatitudeLongitude < ActiveRecord::Migration[5.1]
  def change
    change_column :businesses, :latitude, 'float USING CAST(latitude AS float)'
    change_column :businesses, :longitude, 'float USING CAST(longitude AS float)'
  end
end
