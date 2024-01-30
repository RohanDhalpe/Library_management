class RenameColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :mobile_no, :phone_number
  end
end
