require 'rails_helper'

RSpec.describe MovieService do
  describe '#class methods'
    it 'top_rated' do

      ms = MovieService.top_rated

      expect(ms).to be_a(Hash)
      expect(ms[:results]).to be_a(Array)
    end
end