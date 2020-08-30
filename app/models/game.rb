class Game < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :presence => true

  scope :alphabetical, -> { order('lower(name)') }

  def self.top_games
    order(:avg_score => :desc).limit(10)
  end

  def update_average_score!
    if self.reviews.count == 0
      self.avg_score = 0
    else
      self.avg_score = self.reviews.map(&:score).sum/self.reviews.count
    end
    self.save
  end
end
