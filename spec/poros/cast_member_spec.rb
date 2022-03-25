require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
    data = {name: "Rich", charecter: "Bob", order: 0}
    cast_member = CastMember.new(data)
    expect(cast_member).to be_a CastMember
    expect(cast_member.name).to eq("Rich")
    expect(cast_member.order).to eq(0)
  end
end
