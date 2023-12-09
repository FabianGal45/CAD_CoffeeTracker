class CreateCoffeePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :coffee_purchases do |t|
      t.decimal :price
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
