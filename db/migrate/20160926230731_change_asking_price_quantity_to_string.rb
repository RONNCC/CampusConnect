class ChangeAskingPriceQuantityToString < ActiveRecord::Migration
  def change
    remove_column :asking_prices, :quanitity
    add_column :asking_prices, :quanitity, :string
  end
end
