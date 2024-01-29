class CreateFinePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :fine_payments do |t|
      t.integer :fine_payment_id
      t.integer :member_id
      t.date :fine_due_date
      t.date :payment_date
      t.float :payment_amount

      t.timestamps
    end
  end
end
