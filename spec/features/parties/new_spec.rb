require 'rails_helper'

RSpec.describe "New Viewing Party", type: :feature do
  it 'has a form to create new party' do
    user = User.create!(name: "Tim", email: "Tim@mail.com")
    visit "/users/#{user.id}/movies/278/viewing-party/new"
end
