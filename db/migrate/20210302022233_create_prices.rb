class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.string  :content,  null: false
      t.timestamps
    end
  end
end
