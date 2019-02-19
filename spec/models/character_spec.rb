require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'is valid with a name' do
    chara = FactoryBot.build(:character)
    expect(chara).to be_valid
  end

  it 'is not valid with no name' do
    chara = FactoryBot.build(:character, name: nil)
    chara.valid?
    expect(chara.errors['name']).to include("can't be blank")
  end
end
