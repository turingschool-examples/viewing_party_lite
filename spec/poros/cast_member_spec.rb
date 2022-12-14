# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
    deets = {
      name: 'Test Name',
      character: 'Test Character'
    }

    c_m = CastMember.new(deets)

    expect(c_m).to be_an_instance_of(CastMember)
    expect(c_m.name).to eq('Test Name')
    expect(c_m.character).to eq('Test Character')
  end
end
