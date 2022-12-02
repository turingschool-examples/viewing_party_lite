# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieCast do
  before(:each) do
    attrs = {
      cast: [
        {
          "name": 'Edward Norton',
          "character": 'The Narrator'
        },
        {
          "name": 'Brad Pitt',
          "character": 'Tyler Durden'
        }
      ]
    }
    @cast = MovieCast.new(attrs)
  end

  it 'exists' do
    expect(@cast).to be_a MovieCast
    expect(@cast.cast_list[0][:name]).to eq('Edward Norton')
    expect(@cast.cast_list[0][:character]).to eq('The Narrator')
    expect(@cast.cast_list[1][:name]).to eq('Brad Pitt')
    expect(@cast.cast_list[1][:character]).to eq('Tyler Durden')
  end

  describe '#cast_format' do
    it 'returns each cast members name and character' do
      expect(@cast.cast).to eq(['Edward Norton as The Narrator', 'Brad Pitt as Tyler Durden'])
    end
  end
end
