class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :price, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
