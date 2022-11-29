require "rails_helper"


RSpec.describe("Welcome Index Page") do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")

    visit(root_path)
  end

  describe("When I visit /") do
    describe("Then I see") do
      it("the project repo name") do
        expect(page).to(have_content("Viewing Party"))
      end

      it("link to back to root") do
        expect(page).to(have_link("Home"))
        expect(current_path).to(eq(root_path))
      end

      it("A button to create a New User") do
        within("#creation") do
          expect(page).to(have_button("Create New User"))
          click_button("Create New User")
          expect(current_path).to(eq("/register"))
        end
      end

      it 'lists existing users and each user links to their dashboard' do 
        within "#all_users" do 
          expect(page).to have_link("steve.smith@gmail.com")
          expect(page).to have_link("mary.smith@gmail.com")
        end
        within "#existing_users-#{@steve.id}" do
          click_link "steve.smith@gmail.com"
          expect(current_path).to eq(user_path(@steve))
          expect(current_path).to_not eq(user_path(@mary))
        end
        click_link "Home"
        within "#existing_users-#{@mary.id}" do
          click_link "mary.smith@gmail.com"
          expect(current_path).to eq(user_path(@mary))
          expect(current_path).to_not eq(user_path(@steve))
        end
      end
    end
  end
end
