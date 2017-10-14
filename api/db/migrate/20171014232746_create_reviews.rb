class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :book
      t.text :review

      t.timestamps
    end
  end
end
