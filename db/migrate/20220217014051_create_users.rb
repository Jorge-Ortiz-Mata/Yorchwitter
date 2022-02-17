class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :genre
      t.string :location
      t.datetime :date_birth
      t.integer :account_id

      t.timestamps
    end
  end
end
