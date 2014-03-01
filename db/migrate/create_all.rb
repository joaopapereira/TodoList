class CreateAll < ActiveRecord::Migration
  def change
      
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :password_field
      t.string :persistence_token

      t.timestamps
    end

    create_table :todos do |t|
      t.number :user_id
      t.string :todo_item
      t.boolean :completed
      t.timestamps
    end 
  end
end
