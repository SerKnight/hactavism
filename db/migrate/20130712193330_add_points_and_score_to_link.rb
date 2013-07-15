class AddPointsAndScoreToLink < ActiveRecord::Migration
  def change
    add_column :links, :points, :integer
    add_column :links, :score, :integer
  end
end
