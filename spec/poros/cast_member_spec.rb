require 'rails_helper'

RSpec.describe CastMember do
  it 'exists and has attributes' do
    cast_member = CastMember.new(name: 'Edward Norton', character: 'The Narrator')

    expect(cast_member).to be_an_instance_of(CastMember)
    expect(cast_member.name).to eq('Edward Norton')
    expect(cast_member.character).to eq('The Narrator')
  end
end
