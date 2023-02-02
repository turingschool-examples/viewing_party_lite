require 'rails_helper'

RSpec.describe SearchResult do
  describe '#initialize' do
    it 'correctly instantiates' do
      detail = Detail.new([{title: "Fight", vote_average: 1.23, runtime: 60, genres: [{name: "Thriller"},{name: "Action"}], overview: "overview"},
        [{name: "John", character: "Smitty"},{name: "Brad", character: "Junie"}], {total_results: 1, results: [{author: "J", content: "review"}]}])

      expect(detail).to be_a(Detail)
      expect(detail.title).to eq("Fight")
      expect(detail.vote_average).to eq(1.23)
      expect(detail.runtime).to eq(60)
      expect(detail.genres.length).to eq(2)
      expect(detail.overview).to eq("overview")
      expect(detail.cast.length).to eq(2)
      expect(detail.total_reviews).to eq(1)
      expect(detail.reviews.length).to eq(1)
    end
  end
end