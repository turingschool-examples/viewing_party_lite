# frozen_string_literal: true

require 'rails_helper'

describe 'movie results/index page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password:
      'test123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/discover'
  end
  it 'links to each movie results details/show page', :vcr do
    click_button 'Find Top Rated Movies'
    click_link 'The Shawshank Redemption'
    expect(current_path).to eq('/movies/278')
  end

  it 'links to the discover movies page', :vcr do
    click_button('Find Top Rated Movies')

    expect(current_path).to eq('/movies')

    click_button('Discover Page')

    expect(current_path).to eq('/discover')
  end
end
