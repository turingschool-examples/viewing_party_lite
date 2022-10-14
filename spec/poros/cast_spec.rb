require 'rails_helper'

RSpec.describe Cast do
  it 'has info about a cast member' do
    data = {
      "adult": false,
      "gender": 2,
      "id": 16_828,
      "known_for_department": 'Acting',
      "name": 'Chris Evans',
      "original_name": 'Chris Evans',
      "popularity": 69.105,
      "profile_path": '/3bOGNsHlrswhyW79uvIHH1V43JI.jpg',
      "cast_id": 9,
      "character": 'Steve Rogers / Captain America',
      "credit_id": '543ecb490e0a2667450001db',
      "order": 0
    }

    cast_member = Cast.new(data)
    expect(cast_member).to be_instance_of(Cast)
    expect(cast_member.id).to eq(9)
    expect(cast_member.name).to eq('Chris Evans')
    expect(cast_member.character).to eq('Steve Rogers / Captain America')
  end
end
