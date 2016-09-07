class CreateAcceptedJobs < ActiveRecord::Migration
  def change
    create_table :accepted_jobs do |t|
      t.integer :job_posting_id
      t.integer :asking_price_id
      t.boolean :completed
      t.text :seller_review
      t.text :buyer_review
      t.integer :seller_rating
      t.integer :buyer_rating

      t.timestamps null: false
    end
  end
end
