class CreateDueAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :due_amounts do |t|
      t.references :issued_book, null: false, foreign_key: true
      t.integer :fine

      t.timestamps
    end
  end
end
