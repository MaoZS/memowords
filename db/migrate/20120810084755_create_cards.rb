class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.text :division
      t.integer :user_id

      t.timestamps
    end
  end
end
