require 'rails_helper'



RSpec.describe MovieService do
<<<<<<< HEAD
  it 'exists' do
    ms = MovieService.top_rated

    expect(ms).to be_a(Hash)
  end

  it '#movies_by_keyword' do
    results = MovieService.movies_by_keyword("Fight")
  require 'pry'; binding.pry 
    expect(results).to be_a(Hash)
  end
=======
  describe '#class methods'
    it 'top_rated' do

      ms = MovieService.top_rated

      expect(ms).to be_a(Hash)
      expect(ms[:results]).to be_a(Array)
    end

  # it ‘movies_by_keyword’ do

  #   results = MovieService.movies_by_keyword("Fight")

  #   expect(results).to be_a(Hash)
  # end
>>>>>>> 37f039b (test/Click button to go to discover top rated results page)
end