require 'rails_helper'

RSpec.describe AnimeCharacter, type: :model do
  it 'is valid with an anime_id and character_id' do
    anime = Anime.create(title: '進撃の巨人')
    character = Character.create(name: 'エレン・イェーガー')
    rel = AnimeCharacter.new(anime_id: anime.id, character_id: character.id)
    expect(rel).to be_valid
  end

  it 'is not valid with no anime_id' do
    character = Character.create(name: 'エレン・イェーガー')
    rel = AnimeCharacter.new(anime_id: nil, character_id: character.id)
    rel.valid?
    expect(rel.errors['anime_id']).to include("can't be blank")
  end

  it 'is not valid with no character_id' do
    anime = Anime.create(title: '進撃の巨人')
    rel = AnimeCharacter.new(anime_id: anime.id, character_id: nil)
    rel.valid?
    expect(rel.errors['character_id']).to include("can't be blank")
  end
end
