require 'rails_helper'

RSpec.describe SearchResult do
  describe '#initialize' do
    it 'correctly instantiates' do
      sr = SearchResult.new({id: 1, title: "Planes", vote_average: 5.56})

      expect(sr).to be_a(SearchResult)
      expect(sr.id).to eq(1)
      expect(sr.title).to eq("Planes")
      expect(sr.vote_average).to eq(5.56)
    end
  end
end