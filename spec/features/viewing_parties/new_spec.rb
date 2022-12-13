require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    # @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    # @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
    # @user_3 = User.create!(name: 'Jan', email: 'jan@gmail.com')
  end

  it 'should fields for party duration, when, start time, check boxes with existing users', :vcr do
    visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"

    expect(page).to have_content("The Godfather")
    expect(page).to have_field(:duration)
    expect(page).to have_field(:day)
    expect(page).to have_field(:start_time)
    expect(page).to_not have_content(@user_1.name)
    expect(page).to have_content(@user_2.name)
  end

  it 'can create new parties', :vcr do
    VCR.insert_cassette "create_parties"
    visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"

    fill_in :duration, with: 175
    fill_in :day, with: "2022-12-14"
    fill_in :start_time, with: "2000-01-01 16:37:00 UTC"
    check("attendees_#{@user_2.id}")
    check("attendees_#{@user_3.id}")

    click_on "Create Party"

    VCR.insert_cassette "user_dash"
    expect(current_path).to eq(user_path(@user_1))
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("2022-12-14")
    expect(page).to have_content("2000-01-01 16:37:00 UTC")
    expect(page).to have_content("Hosting")
    VCR.eject_cassette
    VCR.eject_cassette
  end

  it 'cannot make a party with missing attributes', :vcr do
    VCR.insert_cassette "missing day"
    visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"
    
    fill_in :duration, with: 175
    fill_in :day, with: ""
    fill_in :start_time, with: Time.parse("18:00")
    check("attendees_#{@user_2.id}")
    check("attendees_#{@user_3.id}")
    click_on "Create Party"

    expect(page).to have_content("Day can't be blank")
    VCR.eject_cassette
  end

  it 'cannot make a party with missing attributes', :vcr do
    VCR.insert_cassette "missing_start_time"
    visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"
    
    fill_in :duration, with: 175
    fill_in :day, with: Date.today
    fill_in :start_time, with: ""
    check("attendees_#{@user_2.id}")
    check("attendees_#{@user_3.id}")
    click_on "Create Party"

    expect(page).to have_content("Start time can't be blank")
    VCR.eject_cassette
  end
end