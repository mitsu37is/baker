require 'rails_helper'

RSpec.describe ActorCharacter, type: :model do
  it 'is valid with an actor_id and character_id' do
    actor = Actor.create(sh_name: '神谷浩史')
    character = Character.create(name: 'エレン・イェーガー')
    rel = ActorCharacter.new(actor_id: actor.id, character_id: character.id)
    expect(rel).to be_valid
  end

  it 'is not valid with no actor_id' do
    character = Character.create(name: 'エレン・イェーガー')
    rel = ActorCharacter.new(actor_id: nil, character_id: character.id)
    rel.valid?
    expect(rel.errors['actor_id']).to include("can't be blank")
  end

  it 'is not valid with no actor_id' do
    actor = Actor.create(sh_name: '神谷浩史')
    rel = ActorCharacter.new(actor_id: actor.id, character_id: nil)
    rel.valid?
    expect(rel.errors['character_id']).to include("can't be blank")
  end
end
