require 'rails_helper'

RSpec.describe MovieData do
 let(:movie_data) { MovieFacade.movie_show(5244) }
 let(:movie2) { MovieFacade.movie_show(278)}

 it 'attributes', :vcr do
   expect(movie_data.id).to eq(5244)
   expect(movie_data.title).to eq('Pleasurecraft')
   expect(movie_data.overview).to be_a(String)
   expect(movie_data.vote_avg).to eq(1.0)
   expect(movie_data.reviews).to eq({})
   expect(movie_data.reviews).to be_a(Hash)
 end

 it 'looks at a different move to get a review ', :vcr do
   VCR.use_cassette('movie2', re_record_interval: 7.days) do
     expect(movie2.reviews).to be_a(Hash)
     expect(movie2.reviews.keys).to eq(["elshaarawy", "John Chard", "tmdb73913433", "thommo_nz", "Andrew Gentry", "Matthew Dixon", "JPV852"])
  end
 end

end
