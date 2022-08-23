require 'rails_helper'

describe 'Admin Merchant New' do
  it "show be able to create a new user" do

    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave@gmail.com'

    click_button 'Create New User'

  end
end
