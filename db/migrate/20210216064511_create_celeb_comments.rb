class CreateCelebComments < ActiveRecord::Migration[6.0]
  def change
    create_table :celeb_comments do |t|
      t.text :content, null: false
      t.references :celeb, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
