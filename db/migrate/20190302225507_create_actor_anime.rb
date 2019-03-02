class CreateActorAnime < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_animes do |t|
      t.references :actor, foreign_key: true
      t.references :anime, foreign_key: true

      t.timestamps
    end
  end
end
