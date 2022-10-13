require 'rails_helper'

RSpec.describe CastMember do
  it 'can create instance of movie' do
    attrs = {
      name: 'Chris Prat',
      character: 'Mario'
    }
    cast_member = CastMember.new(attrs)
    expect(cast_member).to be_a CastMember
    expect(cast_member.name).to eq('Chris Prat')
    expect(cast_member.character).to eq('Mario')
  end
end
