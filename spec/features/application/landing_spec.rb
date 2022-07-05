require 'rails_helper' 

RSpec.describe 'landing page', type: :feature do

  it "displays the title of the application, a button to create new users, and existing users" do
    
    
    visit "/"

    expect(page).to have_content("Viewing Party Light")
    expect(page).to have_button("Create a New User")
    expect(page).to have_content("Existing Users:")
    
  end
end