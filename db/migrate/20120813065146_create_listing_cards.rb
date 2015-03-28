class CreateListingCards < ActiveRecord::Migration
  def change
    create_table :listing_cards do |t|
      t.integer :memoword_id
      t.integer :card_id
      t.boolean :memorized

      t.timestamps
    end
  end
end
