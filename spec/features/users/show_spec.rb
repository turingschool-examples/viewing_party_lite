require 'rails_helper'

RSpec.describe "User Dashboard" do 
  let!(:user_1) { User.create!(name: "Sam", email: "sam@zmail.com" ) }
  let!(:vp_1) { user_1.parties.create!(duration: 101, date: Date.new(2022,07,20), start_time: '15:00:00' )}

  it "Has users name in heading" do 
    visit user_path(user_1.id)

    expect(page).to have_content("#{user_1.name}'s Dashboard")
  end

  it "has button to discover movies" do 
    visit user_path(user_1.id)

    expect(page).to have_button("Discover Movies")
  end

  it "has section that shows viewing parties" do 
    visit user_path(user_1.id)

    expect(page).to have_content("Viewing Parties")
    expect(page).to have_content(vp_1.date)
    expect(page).to have_content(vp_1.start_time)
    expect(page).to have_content(vp_1.duration)
    # expect(page).to have_content(vp_1.movie_title)
  end
end