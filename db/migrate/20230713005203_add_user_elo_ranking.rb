class AddUserEloRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :elo_ranking, :integer
  end
end
