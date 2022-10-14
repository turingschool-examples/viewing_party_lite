require 'rails_helper'

RSpec.describe Cast do

  it 'exists and has attributes' do
    fake_data = {

      name: "Jared Leto",
      character: "Angel Face",

    }
    cast_member = Cast.new(fake_data)

    expect(cast_member).to be_a(Cast)
    expect(cast_member.name).to eq("Jared Leto")
    expect(cast_member.character).to eq("Angel Face")
  end
end
