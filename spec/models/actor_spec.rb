# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'is valid with a name' do
    actor = FactoryBot.build(:actor)
    expect(actor).to be_valid
  end

  it 'is not valid with no name' do
    actor = FactoryBot.build(:actor, name: nil)
    actor.valid?
    expect(actor.errors['name']).to include("can't be blank")
  end
end
