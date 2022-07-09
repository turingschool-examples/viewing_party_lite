require 'rails_helper'

RSpec.describe Actor do
  it 'describes actor' do
    data = {
            "adult": false,
            "gender": 2,
            "id": 3084,
            "known_for_department": "Acting",
            "name": "Marlon Brando",
            "original_name": "Marlon Brando",
            "popularity": 16.997,
            "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
            "cast_id": 5,
            "character": "Don Vito Corleone",
            "credit_id": "52fe422bc3a36847f8009357",
            "order": 0
        }

    cast = Actor.new(data)

    expect(cast).to be_a(Actor)
    expect(cast.name).to eq("Marlon Brando")
    expect(cast.character).to eq("Don Vito Corleone")
  end
end
