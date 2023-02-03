require 'rails_helper'

RSpec.describe Character do
  it 'exist with attributes' do
    character = Character.new({ name: 'billy bob', character: 'joey' })

    expect(character).to be_a(Character)
    expect(character.actor).to eq('billy bob')
    expect(character.character).to eq('joey')
  end
end
