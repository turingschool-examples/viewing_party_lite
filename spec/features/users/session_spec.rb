require 'rails_helper'

RSpec.describe 'user log in' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  before :each do
    visit root_path
  end

  it 'can log in and log out' do

    fill_in :email, with: "#{user1.email}"
    fill_in :password, with: "#{user1.password}"
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome #{user1.name}!")
    expect(page).to_not have_button('Log In')
    expect(page).to_not have_button('Create a New User')
    expect(page).to have_link('Log Out')

    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_button('Log In')
    expect(page).to have_button('Create a New User')
    expect(page).to_not have_link('Log Out')
    expect(page).to have_content('Existing Users:')

    within "#user-#{user1.id}" do
      expect(page).to have_content("#{user1.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end

    within "#user-#{user2.id}" do
      expect(page).to have_content("#{user2.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end

    within "#user-#{user3.id}" do
      expect(page).to have_content("#{user3.email.gsub(/(?<=[\w\d])[\w\d]+(?=[\w\d])/, "**")}")
    end
  end

  it 'shows an error if password is incorrect' do

    fill_in :email, with: "#{user1.email}"
    fill_in :password, with: '12345'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials!')
  end

  it 'shows an error if user does not exist' do

    fill_in :email, with: 'ricki@trashtv.com'
    fill_in :password, with: 'password'
    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Invalid credentials!')
  end

  describe 'Admin login' do
    it "I can log in as an admin and get to my dashboard" do
      admin = create(:user, admin: true)

      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'Log In'

      expect(current_path).to eq(admin_dashboard_path)

      within "#user-#{user1.id}" do
        expect(page).to have_link("#{user1.email}'s Dashboard")
      end

      within "#user-#{user2.id}" do
        expect(page).to have_link("#{user2.email}'s Dashboard")
      end

      within "#user-#{user3.id}" do
        expect(page).to have_link("#{user3.email}'s Dashboard")
      end

      # click_link "#{user1.email}'s Dashboard"
      #
      # expect(page).to have_content("#{user1.name}'s Dashboard")
      # expect(page).to have_button('Discover Movies')
      # expect(page).to have_content('Viewing Parties')
    end
  end
end
