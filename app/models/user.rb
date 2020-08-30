class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  has_many :games, through: :reviews

  validates :username, :email, :presence => true, :uniqueness => true
  validate :valid_email?

  def valid_email?
    if !email.include?("@")
      errors.add(:email, "is not a valid email address")
    end
  end

  def self.top_reviewers
    review_count = Array.new

    self.all.each do |user|
      user_hash = Hash.new
      user_hash[:id] = user.id
      user_hash[:username] = user.username
      user_hash[:count] = user.reviews.count
      review_count << user_hash
    end

    review_count.sort_by { |x| -x[:count] }.first(10)
  end
end
