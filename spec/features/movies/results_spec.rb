require 'rails_helper'

RSpec.describe "movies results page" do
  it "has top rated movies" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com")
    visit "/users/#{user_1.id}/movies?q=top%20rated"

  end
end