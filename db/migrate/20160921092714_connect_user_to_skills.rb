class ConnectUserToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :user_id, :integer
    remove_column :asking_prices, :user_id
  end
end
