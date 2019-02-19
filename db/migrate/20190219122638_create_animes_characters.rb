class CreateAnimesCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :animes_characters do |t|
      t.references :anime, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
