class MakeBuyerAndSellerCompletedForAccJob < ActiveRecord::Migration
  def change
    remove_column :accepted_jobs, :completed
    add_column :accepted_jobs, :buyer_completed, :boolean
    add_column :accepted_jobs, :seller_completed, :boolean
  end
end
