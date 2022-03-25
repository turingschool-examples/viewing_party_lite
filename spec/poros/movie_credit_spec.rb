require 'rails_helper'
RSpec.describe MovieCredit do
  it 'exists with attributes' do

    credit_data = {
    :adult=>false,
    :gender=>2,
    :id=>35742,
    :known_for_department=>"Acting",
    :name=>"Shah Rukh Khan",
    :original_name=>"Shah Rukh Khan",
    :popularity=>12.137,
    :profile_path=>"/hfSYu9Jmq2TgGcj2e2dmdLsYjeg.jpg",
    :cast_id=>1,
    :character=>"Raj Malhotra",
    :credit_id=>"52fe47d69251416c750a71a1",
    :order=>0
  }
  credit_data = MovieCredit.new(credit_data)
  expect(credit_data).to be_a MovieCredit
  expect(credit_data.name).to eq("Shah Rukh Khan")
  expect(credit_data.character).to eq("Raj Malhotra")
  end
end
