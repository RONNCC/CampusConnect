class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.integer :user_id
      t.text :bio

      t.timestamps null: false
    end
  end
end
