class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.integer :rating
      t.integer :price
      t.integer :phone
      t.string :name
      t.integer :review_count
      t.string :image_url
      t.string :city
      t.string :country
      t.string :address
      t.string :state
      t.integer :zip_code
      t.string :term

      t.timestamps
    end
  end
end
