class MoveBuyerAndSellerIntoUser < ActiveRecord::Migration
  def change
    drop_table :buyers
    drop_table :sellers
    add_column :users, :buyer_bio, :text
    add_column :users, :seller_bio, :text
    remove_column :job_postings, :buyer_id
    add_column :job_postings, :user_id, :integer
    remove_column :asking_prices, :seller_id
    add_column :asking_prices, :user_id, :integer
    remove_column :payment_informations, :buyer_id
    add_column :payment_informations, :user_id, :integer
  end
end
