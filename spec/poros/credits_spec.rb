require 'rails_helper'

RSpec.describe Credits do
  describe 'Credits Poro', :vcr do
    before :each do 
      @credits = MovieFacade.credits_poro(550)
    end

    it 'instantiates' do
      expect(@credits).to be_a(Credits)
    end

    it '@credits returns an array of hashes' do 
      expect(@credits.cast_info).to be_a(Array)
      expect(@credits.cast_info[0]).to be_a(Hash)
      expect(@credits.cast_info[0][:name]).to be_a(String)
    end

    it 'returns all names of cast members' do
      expect(@credits.cast_names).to be_a(Array)
      expect(@credits.cast_names[0]).to be_a(String)
      require 'pry'; binding.pry
    end
  end

end