class CreateTransaction < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamp :date_borrowed
      t.timestamp :date_returned
      t.timestamps
    end
  end
end
