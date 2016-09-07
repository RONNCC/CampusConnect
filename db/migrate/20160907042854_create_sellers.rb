class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :user_id
      t.text :bio
      t.string :location

      t.timestamps null: false
    end
  end
end
