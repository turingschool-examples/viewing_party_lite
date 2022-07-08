require 'rails_helper'

RSpec.describe Actor do
  it 'has a name and character' do
    data = {
        "adult": false,
        "gender": 2,
        "id": 504,
        "known_for_department": "Acting",
        "name": "Tim Robbins",
        "original_name": "Tim Robbins",
        "popularity": 19.133,
        "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg",
        "cast_id": 3,
        "character": "Andy Dufresne",
        "credit_id": "52fe4231c3a36847f800b131",
        "order": 0
        }
    actor = Actor.new(data)

    expect(actor).to be_a(Actor)
    expect(actor.name).to eq("Tim Robbins")
    expect(actor.character).to eq("Andy Dufresne")
  end
end
