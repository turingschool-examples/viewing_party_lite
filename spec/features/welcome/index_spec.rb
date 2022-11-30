require "rails_helper"


RSpec.describe("Welcome Index Page") do
  before(:each) do
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
    end
  end
end
