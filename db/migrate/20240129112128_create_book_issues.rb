class CreateBookIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :book_issues do |t|
      t.integer :issue_id
      t.integer :book_id
      t.integer :user_id
      t.date :issue_date
      t.date :return_date

      t.timestamps
    end
  end
end
