# fozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieCast do
  it 'exists and has attributs' do
    data = {
    "id": 550,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 819,
            "known_for_department": "Acting",
            "name": "Edward Norton",
            "original_name": "Edward Norton",
            "popularity": 18.593,
            "profile_path": "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
            "cast_id": 4,
            "character": "The Narrator",
            "credit_id": "52fe4250c3a36847f80149f3",
            "order": 0
        },
        {
            "adult": false,
            "gender": 2,
            "id": 287,
            "known_for_department": "Acting",
            "name": "Brad Pitt",
            "original_name": "Brad Pitt",
            "popularity": 53.904,
            "profile_path": "/cckcYc2v0yh1tc9QjRelptcOBko.jpg",
            "cast_id": 5,
            "character": "Tyler Durden",
            "credit_id": "52fe4250c3a36847f80149f7",
            "order": 1
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1283,
            "known_for_department": "Acting",
            "name": "Helena Bonham Carter",
            "original_name": "Helena Bonham Carter",
            "popularity": 34.087,
            "profile_path": "/DDeITcCpnBd0CkAIRPhggy9bt5.jpg",
            "cast_id": 6,
            "character": "Marla Singer",
            "credit_id": "52fe4250c3a36847f80149fb",
            "order": 2
        },
        {
            "adult": false,
            "gender": 2,
            "id": 7470,
            "known_for_department": "Acting",
            "name": "Meat Loaf",
            "original_name": "Meat Loaf",
            "popularity": 3.811,
            "profile_path": "/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg",
            "cast_id": 7,
            "character": "Robert \"Bob\" Paulson",
            "credit_id": "52fe4250c3a36847f80149ff",
            "order": 3
        },
        ]
      }

    cast_member = MovieCast.new(data[:cast].first)

    expect(cast_member.character).to eq("The Narrator")
    expect(cast_member.name).to eq("Edward Norton")
  end
end
