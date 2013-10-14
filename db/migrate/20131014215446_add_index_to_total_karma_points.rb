class AddIndexToTotalKarmaPoints < ActiveRecord::Migration
  def change
    add_index :users, :total_karma_points
  end
end
