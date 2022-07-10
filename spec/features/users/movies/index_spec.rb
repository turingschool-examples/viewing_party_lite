# frozen_string_literal: true
require 'rails_helper'

describe 'movie results/index page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
    visit "users/#{@user1.id}/discover"
  end
  it 'links to each movie results details/show page', :vcr do
    click_button "Find Top Rated Movies"
    click_link "The Shawshank Redemption"
    expect(current_path).to eq("/users/#{@user1.id}/movies/278")
  end
end
