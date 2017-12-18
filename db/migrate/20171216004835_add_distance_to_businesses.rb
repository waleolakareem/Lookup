class AddDistanceToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :distance, :integer
  end
end
