require 'rails_helper' 

RSpec.describe "Welcome Page" do 
  before(:each) do
    user = User.create!(name: "Benson" ,email: "benson@example.com")
    user2 = User.create!(name: "Mordecai" ,email: "mc@gmail.com")
    user3 = User.create!(name: "Rigby" ,email: "rigzbee@aol.com")

    visit '/'
  end 

  it "should title of application" do 
    expect(page).to have_content("Viewing Party Light")      
  end 

  it "should have button to create a new user" do 
    expect(page).to have_button("Create a New User")    
  end 
end 