require 'rails_helper'

describe 'Create a New User' do
  it "show be able to create a new user" do

    user = User.create!(name: "bob", email: "bob@gmail.com")
    user = User.create!(name: "tom", email: "tom@gmail.com")

    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave@gmail.com'

    click_button 'Create New User'

  end
  it "should not be able to create a new user" do

    user = User.create!(name: "bob", email: "bob@gmail.com")
    user = User.create!(name: "tom", email: "tom@gmail.com")

    visit '/register'

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'tom@gmail.com'

    click_button 'Create New User'

  end
end
