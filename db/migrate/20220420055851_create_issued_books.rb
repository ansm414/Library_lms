class CreateIssuedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issued_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :issue_date
      t.datetime :return_date
      t.boolean :returned, default: false
      t.datetime :user_returned_date, default: nil

      t.timestamps
    end
  end
end
