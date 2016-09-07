class CreateAskingPrices < ActiveRecord::Migration
  def change
    create_table :asking_prices do |t|
      t.integer :seller_id
      t.integer :skill_id
      t.string :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
