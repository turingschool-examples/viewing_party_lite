# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Credits do
  describe 'Credits Poro', :vcr do
    before :each do
      @credits_array = MovieFacade.credits_poro(550)
    end

    it 'instantiates' do
      @credits_array.each do |cast_member|
        expect(cast_member).to be_a(Credits)
      end
    end

    it 'returns an array of Credits objects with name as a string' do
      expect(@credits_array).to be_a(Array)

      @credits_array.each do |cast_member|
        expect(cast_member.name).to be_a(String)
      end
    end

    it 'returns top 10 cast members ' do
      expect(@credits_array.count).to eq(10)
    end
  end
end
