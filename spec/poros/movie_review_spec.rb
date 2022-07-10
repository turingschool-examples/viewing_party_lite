# frozen_string_literal: true

# fozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieReview do
  it 'exists and has attributs' do
    data = {
      "id": 550,
      "page": 1,
      "results": [
        {
          "author": 'Goddard',
          "author_details": {
            "name": '',
            "username": 'Goddard',
            "avatar_path": '/https://www.gravatar.com/avatar/f248ec34f953bc62cafcbdd81fddd6b6.jpg',
            "rating": nil
          },
          "content": 'Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.',
          "created_at": '2018-06-09T17:51:53.359Z',
          "id": '5b1c13b9c3a36848f2026384',
          "updated_at": '2021-06-23T15:58:09.421Z',
          "url": 'https://www.themoviedb.org/review/5b1c13b9c3a36848f2026384'
        }
      ],
      "total_pages": 1,
      "total_results": 7
    }

    review = MovieReview.new(data[:results].first)
    expect(review.author).to eq('Goddard')
    expect(review.content).to eq('Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.')
  end
end
