require 'rails_helper'

RSpec.describe 'the home page' do
  before :each do
    @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
    @yuji = User.create!(name: "Yuji", email: "yuyuhakusho2020@hotmail.com")
    @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")
  end

  it "has the title 'Viewing Party'" do
    visit '/'

    expect(page).to have_content('Viewing Party')
  end

  it "has a link at the top to go to Home Page" do
    visit '/'

    expect(page).to have_content('Home Page')
    click_on "Home Page"
    expect(current_path).to eql('/')
  end

  it "has a button to create a new user" do
    visit '/'

    expect(page).to have_button('Create New User')

    click_button 'Create New User'

    expect(current_path).to eql('/register')
  end

  it "has a list of existing users with each user being a link to their respective dashboard" do
    visit '/'

    expect(page).to have_link("Mostafa")
    expect(page).to have_link("Yuji")
    expect(page).to have_link("Bryan")

   
    click_on "Yuji"

    expect(current_path).to eql("/users/#{@yuji.id}")
  end
end