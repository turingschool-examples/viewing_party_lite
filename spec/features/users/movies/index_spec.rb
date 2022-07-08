# frozen_string_literal: true

require 'rails_helper'

describe 'movie results/index page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com')
    visit "users/#{@user1.id}/discover"
  end
  it 'links to each movie results details/show page' do
    # ##is there a way to test this? I'm blanking
  end
end
