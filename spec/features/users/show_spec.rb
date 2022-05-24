require "rails_helper"

describe "User dashboard/show" do
  before do
    @user1 = User.create!(name: "User One", email: "user1@test.com", password: "test123", password_confirmation: "test123")
    @user2 = User.create!(name: "User Two", email: "user2@test.com", password: "test123", password_confirmation: "test123")
    @user3 = User.create!(name: "User Three", email: "user3@test.com", password: "test123", password_confirmation: "test123")

    @u1_vp = Party.create!(event_date: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o4, 26, 6, 0, 0, "-07:00"), user_id: @user1.id, movie_id: 24021)
    @u1_vp_inv_1 = Invitation.create!(user_id: @user1.id, party_id: @u1_vp.id)
    @u1_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u1_vp.id)

    @u2_vp = Party.create!(event_date: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), duration: "230 mins", start_time: DateTime.new(2002, 0o2, 24, 7, 0, 0, "-07:00"), user_id: @user2.id, movie_id: 809)
    @u2_vp_inv_1 = Invitation.create!(user_id: @user2.id, party_id: @u2_vp.id)
    @u2_vp_inv_2 = Invitation.create!(user_id: @user3.id, party_id: @u2_vp.id)

    VCR.insert_cassette("has_a_section_that_lists_viewing_parties")
    visit "/users/#{@user1.id}"
  end

  after do
    VCR.eject_cassette
  end

  it "displays the users name" do
    expect(page).to have_content("User One's page")
    expect(page).not_to have_content("User Two's page")
  end

  it "has a button to discover movies" do
    click_button("Discover Movies")

    expect(current_path).to eq("/users/#{@user1.id}/discover")
    expect(current_path).not_to eq("/users/#{@user2.id}/discover")
  end

  it "has a section that lists viewing parties", :vcr do
    within "#viewing_parties" do
      expect(page.find("#movie_poster")["src"]).to have_content "http://image.tmdb.org/t/p/w300/3mFM80dPzSqoXXuC2UMvLIRWX32.jpg"
      expect(page).to have_content("Party ##{@u1_vp.id}")
      expect(page).to have_link("The Twilight Saga: Eclipse")
      expect(page).to have_content("Date & Time: April 26, 2002 at 01:00")
      expect(page).to have_content("You are hosting!")

      expect(page).not_to have_content("Host: User Two")
    end

    within "##{@u1_vp.id}-invited" do
      expect(page).to have_content("Invited: User Three")
    end
  end

  it "i see a link to go back to the landing page" do
    click_link("Return to Home Page")

    expect(current_path).to eq("/")
  end

  context "invitations" do
    before do
      VCR.eject_cassette
    end
    after do
      VCR.insert_cassette("has_a_section_that_lists_viewing_parties")
    end
    it "displays movie invitation content when user is not the hose", :vcr do
      visit "/users/#{@user3.id}"
      within "#party_#{@u2_vp.id}" do
        expect(page.find("#movie_poster")["src"]).to have_content "http://image.tmdb.org/t/p/w300/2yYP0PQjG8zVqturh1BAqu2Tixl.jpg"
        expect(page).to have_content("Party ##{@u2_vp.id}")
        expect(page).to have_link("Shrek 2")
        expect(page).to have_content("Date & Time: February 24, 2002 at 02:00")
        expect(page).to have_content("Host: User Two")

        expect(page).not_to have_content("Host: User One")
      end
      within "##{@u2_vp.id}-invited" do
        expect(page).to have_content("Invited: User Three")
        expect(page).to have_selector("strong", text: "User Three")
        expect(page).not_to have_content("User two")
      end
    end
  end
end
