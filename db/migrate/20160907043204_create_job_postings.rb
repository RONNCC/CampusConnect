class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.integer :buyer_id
      t.string :job_name
      t.text :description
      t.text :skills_required
      t.string :estimated_time

      t.timestamps null: false
    end
  end
end
