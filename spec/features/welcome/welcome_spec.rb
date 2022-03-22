require 'rails_helper' 

RSpec.describe "Welcome Page" do 
    before(:each) do
      user = User.create!(name: "Benson" ,email: "benson@example.com")
      user2 = User.create!(name: "Mordecai" ,email: "mc@gmail.com")
      user3 = User.create!(name: "Rigby" ,email: "rigzbee@aol.com")
    end 

    it "should title of application" do 
      visit '/'
      expect(page).to have_content("Viewing Party Light")      
      save_and_open_page
    end 
end 