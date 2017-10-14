class AddAvailabiltyToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :is_available, :boolean, default: true
    rename_column :books, :user_id, :created_by
  end
end
