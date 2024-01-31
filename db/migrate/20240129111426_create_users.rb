class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :book, foreign_key: true 
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :mobile_no

      t.timestamps
    end
  end
end
