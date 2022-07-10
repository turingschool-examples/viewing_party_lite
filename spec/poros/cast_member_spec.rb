require 'rails_helper'

RSpec.describe CastMember do
  it 'exists with attributes' do
    parker = CastMember.new({name: "Parker Thomson", character: "Griffith"})
    expect(parker).to be_an_instance_of(CastMember)
    expect(parker.name).to eq("Parker Thomson")
    expect(parker.character).to eq("Griffith")
  end
end
