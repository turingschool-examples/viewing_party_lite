require 'rails_helper'

RSpec.describe 'movie results page' do
  before(:each) do
    @user1 = User.create!(name: "Jess", email: "Jess@fakemail.com")
  end
  it 'shows the movie title and vote average' do
    visit "users/#{@user1.id}/movies/278"
    expect(page).to have_link("")
  end 
end