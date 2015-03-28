class CreateMemowords < ActiveRecord::Migration
  def change
    create_table :memowords do |t|
      t.integer :number
      t.string :division
      t.string :title
      t.string :comment
      t.integer :user_id
      t.text :cards_ary

      t.timestamps
    end
  end
end
