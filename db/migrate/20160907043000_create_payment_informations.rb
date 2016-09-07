class CreatePaymentInformations < ActiveRecord::Migration
  def change
    create_table :payment_informations do |t|
      t.integer :buyer_id
      t.integer :card_number
      t.integer :cvv_code
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
