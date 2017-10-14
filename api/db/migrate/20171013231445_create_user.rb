class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :lastname, null:false
      t.string :firstname, null:false
      t.string :email, null:false
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
