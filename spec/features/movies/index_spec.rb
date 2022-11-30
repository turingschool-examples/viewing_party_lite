require "rails_helper"

RSpec.describe "discover movies page or movies index page " do
  describe 'discover page' do 
    before :each do 
      @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
      @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")
    end
    describe 'after top rated movies button is clicked' do 
      it 'shows a list of top rated movies from the api' do 
        visit user_discover_path(@steve)
        click_button "Find Top Rated Movies"
      end
    end

    describe 'find movies search function' do 
      it 'enter keyword into search and it returns movies with that word' do 
        visit user_discover_path(@steve)
        # click_button "Submit"
      end
    end
  end
  
end