# coding : utf-8
class Memoword < ActiveRecord::Base
  attr_accessible  :comment, :division, :title
  belongs_to :user
  has_many :listing_cards
  has_many :cards, :through => :listing_cards
  
  validates :division,:title,
    :length => {:maximum => 40, :message => '40文字以下にしてください'}
  
  validates :comment,
    :length => {:maximum => 400, :message => '400文字以下にしてください'}
    
    
end
