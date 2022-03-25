require 'rails_helper'

RSpec.describe CastMember do
  it 'has attributes' do
    data = {
      name: 'Robert Pattinson',
      character: 'Batman',
      id: 289
    }

    actor = CastMember.new(data)

    expect(actor).to be_an_instance_of(CastMember)
    expect(actor.name).to eq('Robert Pattinson')
    expect(actor.character).to eq('Batman')
    expect(actor.id).to eq(289)
  end
end
