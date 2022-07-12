require 'rails_helper'

RSpec.describe 'Create Party Page' do
  before :each do
    @user = User.create!(name: 'Obama', email: 'obamacare@gmail.com', password: 'password1',
                         password_confirmation: 'password1')
    @user2 = User.create!(name: 'Rick', email: 'rickandmorty@gmail.com', password: 'password123',
                          password_confirmation: 'password123')
    @movie_id = 278
  end

  it 'can create a party for a movie' do
    visit "/users/#{@user.id}/movies/#{@movie_id}/party/new"

    expect(page).to have_content('The Shawshank Redemption')

    fill_in :duration_time, with: 90
    fill_in :start_date, with: Date.today
    fill_in :start_time, with: Time.now
    click_button('Create Party')

    expect(current_path).to eq("/users/#{@user.id}")
  end
end
