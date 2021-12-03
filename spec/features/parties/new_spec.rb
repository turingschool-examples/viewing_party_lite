require "rails_helper"

RSpec.describe "party new page", type: :feature do

  before(:each) do
    @haewon = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")
    @sean = User.create!(name: "Sean Morris", email: "seanmorris@gmail.com")
    @matt = User.create!(name: "Matt Holmes", email: "mattholmes@gmail.com")
    @cydnee = User.create!(name: "Cydnee Owens", email: "cydowens@gmail.com")
    @stephanie = User.create!(name: "Stephanie Helm", email: "shelm@gmail.com")
#(title: "Gabriel's Inferno", vote_average: 8.6, movie_id: 696374)



  end

  it "has some titles and buttons" do
    VCR.use_cassette("movie_for_party_new_page") do
      @movie = MovieFacade.movie_details(238)
      visit new_user_movie_party_path(@haewon, 238)

      expect(page).to have_content("Viewing Party Light")
      expect(page).to have_content("Create a Movie Party for #{@movie.title}")
      expect(page).to have_button("Discover Page")
      expect(page).to have_content("Viewing Party Details")

    end
  end
      # <%= collection_check_boxes(:party_invitees, @users, method: :post, default: :false) %>
  # class PartiesController < ApplicationController
  #   def new
  #     @user = User.find(params[:user_id])
  #     @movie = MovieFacade.movie_details(params[:movie_id])
  #   end
  # end
  xit "can create a new party" do
    fill_in "Day", with: "12/05/2021"
    # page.find(:day).set(12-05-2021)
    # select "12/05/2021", from: :day
    # select "12:13 PM", from: :start_time
  end

end
