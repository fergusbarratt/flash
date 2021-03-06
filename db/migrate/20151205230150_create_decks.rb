class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.integer :recent
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
