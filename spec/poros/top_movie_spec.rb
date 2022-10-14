require 'rails_helper'

RSpec.describe TopMovie do
  it 'has lots of movie details' do
    data =
      { "genres": [{
        "id": 99,
        "name": 'Documentary'
      }],
        "id": 8,
        "overview": 'Timo Novotny labels his new project an experimental music documentary film, in a remix of the celebrated film Megacities (1997), a visually refined essay on the hidden faces of several world "megacities" by leading Austrian documentarist Michael Glawogger. Novotny complements 30 % of material taken straight from the film (and re-edited) with 70 % as yet unseen footage in which he blends original shots unused by Glawogger with his own sequences (shot by Megacities cameraman Wolfgang Thaler) from Tokyo. Alongside the Japanese metropolis, Life in Loops takes us right into the atmosphere of Mexico City, New York, Moscow and Bombay. This electrifying combination of fascinating film images and an equally compelling soundtrack from Sofa Surfers sets us off on a stunning audiovisual adventure across the continents. The film also makes an original contribution to the discussion on new trends in documentary filmmaking. Written by KARLOVY VARY IFF 2006',
        "poster_path": '/x7Sz339F2oC8mBf0DHCQpKizXaL.jpg',
        "revenue": 0,
        "runtime": 80,
        "title": 'Life in Loops (A Megacities RMX)',
        "vote_average": 7.7 }

    movie_data = TopMovie.new(data)

    expect(movie_data.title).to eq('Life in Loops (A Megacities RMX)')
    expect(movie_data.rating).to eq(7.7)
  end
end
