class FixAskingPrice < ActiveRecord::Migration
  def change
    remove_column :asking_prices, :quanitity
    remove_column :asking_prices, :quantity
    add_column :asking_prices, :quantity, :string
  end
end
