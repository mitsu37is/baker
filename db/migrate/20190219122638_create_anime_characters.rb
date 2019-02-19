class CreateAnimeCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_characters do |t|
      t.references :anime, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
