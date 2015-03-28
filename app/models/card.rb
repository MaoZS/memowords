# coding : utf-8
class Card < ActiveRecord::Base
  attr_accessible :answer, :division, :question
  belongs_to :user
  has_many :listing_cards
  has_many :memowords, :through => :listing_cards
  
  validates  :question,:answer,
   :presence => {:message => '何も書かれていません'},
   :length   => {:maximum => 400, :message => '文章が長すぎます、400文字以下にしてください'}
  
#  validate :division
  
#  validate :user_id

  
end
