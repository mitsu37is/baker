# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'is valid with a name and a sh_name' do
    actor = Actor.new(name: '神谷 浩史', sh_name: '神谷浩史')
    expect(actor).to be_valid
  end

  it 'is valid with no name' do
    actor = Actor.new(name: nil, sh_name: '神谷浩史')
    expect(actor).to be_valid
  end

  it 'is invalid with no sh_name' do
    actor = Actor.new(name: '神谷 浩史', sh_name: nil)
    actor.valid?
    expect(actor.errors['sh_name']).to include("can't be blank")
  end
end
