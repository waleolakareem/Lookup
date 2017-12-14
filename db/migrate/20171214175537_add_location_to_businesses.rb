class AddLocationToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :location, :string
  end
end
