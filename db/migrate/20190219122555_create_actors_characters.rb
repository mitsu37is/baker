class CreateActorsCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :actors_characters do |t|
      t.references :actor, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
