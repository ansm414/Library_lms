class CreateRequestedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :requested_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
