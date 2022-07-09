require 'rails_helper'

RSpec.describe MovieService do
  describe 'api endpoint' do
    it 'can retrieve data from an api endpoint', :vcr do
      json = MovieService.get_top_rated

      expect(json).to be_a(Array)
      expect(json[0]).to have_key(:title)
    end
  end
end
