class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :log_in_name
      t.string :suspend

      t.timestamps
    end
  end
end
