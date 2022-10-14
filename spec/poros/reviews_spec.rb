require 'rails_helper'

RSpec.describe Reviews do
  it 'has a reveiws data' do
    data = {
      "author": 'StevenGarcia',
      "author_details": {
        "name": '',
        "username": 'StevenGarcia',
        "avatar_path": '/fHn06qnGevmlAORPA5RAv7DUbB.jpg',
        "rating": nil
      },
      "content": "Captain America vs Iron Man. Setting 2 of Marvel's greatest heroes against each other was truly the fight of the century. Now that is an action-packed superhero movie!",
      "created_at": '2020-01-16T23:42:54.146Z',
      "id": '5e20f4fe397df00012969c6a',
      "updated_at": '2021-06-23T15:58:32.513Z',
      "url": 'https://www.themoviedb.org/review/5e20f4fe397df00012969c6a'
    }

    review = Reviews.new(data)
    expect(review).to be_instance_of(Reviews)
    expect(review.author).to eq('StevenGarcia')
    expect(review.content).to eq("Captain America vs Iron Man. Setting 2 of Marvel's greatest heroes against each other was truly the fight of the century. Now that is an action-packed superhero movie!")
  end
end
