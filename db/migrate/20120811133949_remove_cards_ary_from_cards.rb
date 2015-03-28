class RemoveCardsAryFromCards < ActiveRecord::Migration
  def up
    remove_column :cards, :cards_ary
      end

  def down
    add_column :cards, :cards_ary, :text
  end
end
