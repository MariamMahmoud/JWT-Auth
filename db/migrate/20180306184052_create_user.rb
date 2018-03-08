class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :country_code
      t.string :phone_number
      t.string :gender
      t.string :birth_date
      t.string :avatar
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
