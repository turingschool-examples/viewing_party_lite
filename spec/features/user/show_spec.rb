require 'rails_helper'

RSpec.describe 'the user show page' do
  before :each do
    @mostafa = User.create!(name: "Mostafa", email: "sasa2020@hotmail.com")
    @yuji = User.create!(name: "Yuji", email: "yuyuhakusho2020@hotmail.com")
    @bryan = User.create!(name: "Bryan", email: "breakingbad2020@hotmail.com")
  end

  it "has <user's name>'s Dahsboard at the top of the page" do
    visit "/users/#{@yuji.id}"

    expect(page).to have_content("Yuji's Dashboard")
    expect(page).to_not have_content("Bryan's Dashboard")

    visit "/users/#{@bryan.id}"

    expect(page).to have_content("Bryan's Dashboard")
    expect(page).to_not have_content("Yuji's Dashboard")
  end

  it "has a button to discover movies" do
    visit "/users/#{@yuji.id}"

    expect(page).to have_button("Discover Movies")

    click_button "Discover Movies"
    
    expect(current_path).to eql("/users/#{@yuji.id}/discover")
  end

  it "has a section for viewing parties" do
    visit "/users/#{@yuji.id}"

    expect(page).to have_content("Viewing Parties")
  end
end