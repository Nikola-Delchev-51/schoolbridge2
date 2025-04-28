class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :building_number
      t.string :street, null: false
      t.string :postcode, null: false
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
