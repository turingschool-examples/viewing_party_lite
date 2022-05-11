require "rails_helper"

describe CastMember do
  it "exists and has attributes" do
    attributes = {
      character: "Walter Sobchak",
      actor: "John Goodman"
    }

    walter = CastMember.new(attributes)

    expect(walter).to be_a CastMember
    expect(walter.character).to eq("Walter Sobchak")
    expect(walter.actor).to eq("John Goodman")
  end
end
