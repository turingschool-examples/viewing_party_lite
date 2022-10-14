require 'rails_helper'

RSpec.describe Cast do
  it 'exists' do
    cast_data = {
      "adult": false,
      "gender": 2,
      "id": 3084,
      "known_for_department": "Acting",
      "name": "Marlon Brando",
      "original_name": "Marlon Brando",
      "popularity": 19.55,
      "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
      "cast_id": 5,
      "character": "Don Vito Corleone",
      "credit_id": "52fe422bc3a36847f8009357",
      "order": 0
    }

    cast_member = Cast.new(cast_data)

    expect(cast_member).to be_a Cast
    expect(cast_member.name).to eq('Marlon Brando')
    expect(cast_member.character).to eq('Don Vito Corleone')
  end
end
