class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title, :content, :score, :presence => true
  validates :score, numericality: { :only_integer => true }, :inclusion => { :in => (1..100),
    :message => "%{value} is not a valid score" }

  accepts_nested_attributes_for :game

  def game_name=(name)
    self.game = Game.find_or_create_by(:name => name)
  end

  def game_name
     self.game ? self.game.name : nil
  end

  def self.recent_reviews
    self.order(:created_at => :desc).limit(10)
  end
end
