require 'rails_helper'

describe Party do
  describe 'relationships' do
    it { should have_many(:user_parties)}
    it { should have_many(:users).through(:user_parties)}
  end

  describe 'validations' do
    it { should validate_presence_of(:date)}
    it { should validate_presence_of(:time)}
    it { should validate_presence_of(:length)}
  end
