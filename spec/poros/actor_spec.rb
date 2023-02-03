# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actor do
  it 'exists' do
    actor_data = {
      name: 'John Stamos',
      character: 'Uncle Jesse'
    }
    actor = Actor.new(actor_data)

    expect(actor).to be_a Actor
    expect(actor.name).to eq('John Stamos')
    expect(actor.character).to eq('Uncle Jesse')
  end
end
