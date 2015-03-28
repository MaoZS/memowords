class ListingCard < ActiveRecord::Base
  attr_accessible :card_id, :memorized, :memoword_id
  belongs_to :memoword
  belongs_to :card
  
  validates :card_id,:memoword_id,
    :presence => :true,
    :format   => {:with => /^\d+$/}
  
end
