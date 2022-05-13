# require 'rails_helper'
#
# RSpec.describe "Movie Info Poro" do
#   xit 'exists and has attributes' do
#     movie_info = MovieInfo.new([
#                           id: 15,
#                           title: "Jitterbug",
#                           vote_average: 7.4,
#                           summary: "The tale of two bugs in the big city",
#                           runtime: 92,
#                         ],
#       cast_members: "Billy Dee Williams",
#       reviews: "I can't believe I haven't watched it again!",
#       poster: nil
#     )
#
#     expect(movie_info.id).to eq(15)
#     expect(movie_info.title).to eq('Jitterbug')
#     expect(movie_info.summary).to be_a(String)
#     expect(movie_info.vote_average).to eq(7.4)
#     expect(movie_info.reviews).to be_a(Hash)
#     expect(movie_info.genre).to eq("Action")
#     expect(movie_info.cast_members).to be_a(Hash)
#     expect(movie_info.runtime).to eq(92)
#     expect(movie_info.poster).to be(nil)
#   end
# end
