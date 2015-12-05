class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :front
      t.string :back
      t.integer :recent
      t.references :deck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
