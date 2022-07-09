# require 'rails_helper'
#
# RSpec.describe MovieDetails do
#
#   it 'populates Movie Details fields from JSON response' do
#     json_response = File.read("/spec/fixtures/movie_details.json")
#     movie_details = MovieDetail.new(json_response)
#     expect(movie_details).to be_a MovieDetail
#     expect(movie_details.title).to eq("The Shawshank Redemption")
#     expect(movie_details.vote_average).to eq(8.7)
#     expect(movie_details.runtime).to eq(142)
#     expect(movie_details[:genres].name.first).to eq(142)
#     expect(movie_details[:credits].cast).to eq(Array)
#     expect(movie_details[:]).to eq(8.7)
#     expect(movie_details).to eq(8.7)
#     expect(movie_details).to eq(8.7)
#   end
# end
