require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before :each do
    # @user1 = User.create(name: "Jake", email: "imjakekim@gmail.com")
    # @user2 = User.create(name: "Riley", email: "rileybmccullough@gmail.com")
    # require "pry"; binding.pry
    # @party1 = ViewingParty.create(movie_title: 'Fellowship of the Ring', length: 200, start_time: Date.today.strftime("%K%M%S"), date: Date.today.strftime("%Y%m%d"))
    # @party2 = ViewingParty.create(movie_title: 'Psych the Movie', length: 150, start_time: Date.today.strftime("%K%M%S"), date: Date.today.strftime("%Y%m%d"))
    # @user_party1 = ViewingPartyUser.create(viewing_party_id: @party1.id, user_id: @user1.id, status: 0)
    # @user_party2 = ViewingPartyUser.create(viewing_party_id: @party2.id, user_id: @user2.id, status: 1)
  end

  xit 'can find page' do
    visit "/users/#{@user1.id}"
save_and_open_page
    expect(page).to have_content(@user1.name)
  end

end
