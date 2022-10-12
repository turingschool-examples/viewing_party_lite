require 'rails_helper'

RSpec.describe "User Dashboard Page", type: :feature do
  before :each do
    @user_1 = create(:user)
    visit user_path(@user_1.id)
  end

  it 'shows name of user on page' do
    expect(page).to have_content("#{@user_1.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")
    expect(current_path).to eq(user_discover_path(@user_1.id))
  end

  it 'has a section which shows user viewing parties' do
    @vp_1 = create(:viewing_party, host: @user_1)
    @vp_2 = create(:viewing_party)
    @vp_3 = create(:viewing_party)
    @vp_2.users << @user_1
    @vp_3.users << @user_1

    visit user_path(@user_1.id)

    within("#vp_#{@vp_1.id}") do
        expect(page).to have_content("Hosting")
        expect(page).to have_content(@vp_1.date.strftime("%B %e, %Y"))
        expect(page).to have_content(@vp_1.start_time.strftime("%l:%M %P"))
    end

    within("#vp_#{@vp_2.id}") do
        expect(page).to have_content("Invited")
        expect(page).to have_content(@vp_2.date.strftime("%B %e, %Y"))
        expect(page).to have_content(@vp_2.start_time.strftime("%l:%M %P"))
    end

    within("#vp_#{@vp_3.id}") do
        expect(page).to have_content("Invited")
        expect(page).to have_content(@vp_3.date.strftime("%B %e, %Y"))
        expect(page).to have_content(@vp_3.start_time.strftime("%l:%M %P"))
    end
  end
end