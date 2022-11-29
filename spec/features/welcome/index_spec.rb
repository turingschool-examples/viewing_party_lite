require 'rails_helper'

RSpec.describe 'welcome index page' do
  before :each do
    visit(root_path)
  end
  it 'should include title of the application' do
    expect(page).to have_content("Viewing Party")
  end
  it 'should have a button to create a new user' do
    expect(page).to have_button("Create New User")
    # click_button "Create New User"

  end
  it 'has a list of existing users which links to the users dashboard' do
    #WIP
  end

  it 'includes a link to the landing page' do
    expect(page).to have_link("Home Page")
    click_link "Home Page"
    expect(current_path).to eq(root_path)
  end
end
