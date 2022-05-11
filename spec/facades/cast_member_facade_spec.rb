require "rails_helper"

describe CastMemberFacade do
  it "returns a max of 10 CastMember POROs", :vcr do
    cast = CastMemberFacade.cast_members(290)

    expect(cast).to be_a Array
    expect(cast[0]).to be_a CastMember
    expect(cast.length).to eq(10)
  end
end
