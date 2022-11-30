require "rails_helper"


RSpec.describe("discover movies page or movies index page ") do
  describe("discover page") do
    before(:each) do
      @steve = User.create!(      name: "Steve",       email: "steve.smith@gmail.com")
      @mary = User.create!(      name: "Mary",       email: "mary.smith@gmail.com")
    end

    describe("after top rated movies button is clicked") do
      it("shows a list of top rated movies from the api") do
        visit(user_discover_path(@steve))
        click_button("Find Top Rated Movies")
        expect(current_path).to(eq("/users/#{@steve.id}/movies"))
        expect(page.status_code).to(eq(200))
        expect(page).to(have_content("The Godfather Vote Average: 8.7"))
        expect(page).to(have_content("20th Century Girl Vote Average: 8.7"))
        expect(page).to(have_content("Dilwale Dulhania Le Jayenge Vote Average: 8.6"))
      end
    end

    describe("find movies search function") do
      it("enter keyword into search and it returns movies with that word") do
        visit(user_discover_path(@steve))
        fill_in("keyword",         with: "godfather")
        click_button("Submit")
        expect(current_path).to(eq("/users/#{@steve.id}/movies"))
        expect(page.status_code).to(eq(200))
        expect(page).to(have_content("The Godfather Vote Average: 8.7"))
        expect(page).to(have_content("The Godfather Part III Vote Average: 7.4"))
        expect(page).to_not(have_content("Dilwale Dulhania Le Jayenge Vote Average: 8.6"))
      end
    end
  end
end
