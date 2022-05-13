require "rails_helper"

RSpec.describe "user dashboard" do
  before :each do
    @user_1 = User.create!(name: "Unreal Ursa", email: "thisaintreal@gotcha.org")
    @user_2 = User.create!(name: "Fake Fanny", email: "nonsense@fake.com")
    @user_3 = User.create!(name: "Ghastly Gary", email: "spooky@dead.org")
    @user_4 = User.create!(name: "Flake Fred", email: "wontshowup@oops.org")

    @party_1 = Party.create!(date: "2022/07/01", start_time: "09:00 PM", duration: 300, host_id: @user_1.id, movie_id: 278)

    @party_2 = Party.create!(date: "2022/07/05", start_time: "10:00 PM", duration: 200, host_id: @user_2.id, movie_id: 278)

    @pu_1 = PartyUser.create!(party_id: @party_1.id, user_id: @user_2.id)
    @pu_2 = PartyUser.create!(party_id: @party_1.id, user_id: @user_4.id)

    @pu_3 = PartyUser.create!(party_id: @party_2.id, user_id: @user_1.id)
    @pu_4 = PartyUser.create!(party_id: @party_2.id, user_id: @user_3.id)

    visit "/users/#{@user_1.id}"
  end

  it "displays user name" do
    expect(page).to have_content("Unreal Ursa's Dashboard")
  end

  it "has button that directs to discover page" do
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it "displays parties user is hosting" do
    within(".hosting") do
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@user_4.name)

      expect(page).to_not have_content(@user_1.name)
      expect(page).to_not have_content(@user_3.name)

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to_not have_content(@party_2.date)
    end
  end

  it "displays parties user is invited to" do
    within(".invited_to") do
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@user_3.name)

      expect(page).to_not have_content(@user_2.name)
      expect(page).to_not have_content(@user_4.name)

      expect(page).to have_content(@party_2.date)
    end
  end
end
