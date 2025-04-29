class AddFieldsToPeople < ActiveRecord::Migration[8.0]
  def change
    change_table :people, bulk: true do |t|
      t.string  :username
      t.string  :forename
      t.string  :middle_name
      t.string  :surname
      t.string  :type                         # STI column
      t.date    :date_of_birth
      t.references :address, foreign_key: true
      t.string :password_digest             # per UML, even if Devise uses encrypted_password
    end

    add_index :people, :username, unique: true
  end
end
