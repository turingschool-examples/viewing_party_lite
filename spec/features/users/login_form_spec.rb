require 'rails_helper'

RSpec.describe "log in page", type: :feature do

  it 'has a fillable email field' do
    visit '/login'

    fill_in "Email", with: "fake-email@test.com"
  end

  it 'has a fillable password field' do
    visit '/login'

    fill_in "Password", with: "password123"
  end

end