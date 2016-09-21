class MoveBuyerAndSellerIntoUser < ActiveRecord::Migration
  def change
    drop_table :buyers
    drop_table :sellers
    add_column :users, :buyer_bio, :text
    add_column :users, :seller_bio, :text
  end
end
