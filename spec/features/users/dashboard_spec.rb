require "rails_helper"

RSpec.describe "User Dashboard" do 
  before :each do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1, host: false)
    create(:user_party, user: @user_1, viewing_party: @party2, host: true)
    
    visit "users/#{@user_1.id}"
  end

  it "will have the user's name" do 
    expect(page).to have_content(@user_1.name)
  end 

  # it 'will have a button to Discover Movies' do 
  #   expect(page).to have_button("Discover Movies")

  #   click_on "Discover Movies"

  #   expect(current_path).to eq("users/:id/discover")
  # end

  it 'will have a section that lists viewing parties' do 
    within "#party#{@party1.id}" do 
      expect(page).to have_content("Invited")
      expect(page).to have_content(Date.today)
      expect(page).to have_content(Time.now.strftime("%I:%M:%S"))
    end 
    
    within "#party#{@party2.id}" do 
      expect(page).to have_content("Hosting")
      expect(page).to have_content(Time.now.strftime("%I:%M:%S"))
    end
  end
end