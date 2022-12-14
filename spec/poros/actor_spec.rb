require 'rails_helper'

RSpec.describe Actor do
  it 'exists' do 
    attrs = {
      name: "Kate Winslet",
      character: "Rose"
    }

    actor = Actor.new(attrs)

    expect(actor).to be_a Actor
    expect(actor.name).to eq("Kate Winslet")
    expect(actor.character).to eq("Rose")
  end
end