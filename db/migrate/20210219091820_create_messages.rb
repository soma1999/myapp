class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :celeb, foreign_key: true
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.boolean    :read, default: false
      t.boolean    :order, default: false
      t.timestamps
    end
  end
end
