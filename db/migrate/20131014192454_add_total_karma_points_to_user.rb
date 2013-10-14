class AddTotalKarmaPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_karma_points, :integer
    execute <<-SQL
      UPDATE users
      SET total_karma_points = sum_value FROM ( SELECT SUM(value) AS sum_value, user_id
                                                FROM karma_points
                                                GROUP BY user_id ) sum_table
      WHERE users.id = sum_table.user_id
    SQL
  end

end
