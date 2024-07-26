class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipal, null: false
      t.string :street, null: false
      t.string :building
      t.string :call, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
