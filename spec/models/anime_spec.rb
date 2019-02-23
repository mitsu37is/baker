require 'rails_helper'

RSpec.describe Anime, type: :model do
  it 'is valid with a title' do
    anime = Anime.new(title: '進撃の巨人')
    expect(anime).to be_valid
  end

  it 'is not valid with no title' do
    anime = Anime.new(title: nil)
    anime.valid?
    expect(anime.errors['title']).to include("can't be blank")
  end
end
