class AddAvgScoreToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :avg_score, :integer, :default => 0
  end
end
