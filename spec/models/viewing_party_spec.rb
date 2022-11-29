require 'rails_helper'

RSpec.describe ViewingParty do 
  describe 'validatioins' do 
    it { should validates_presence_of :movie_title}
    it { should validates_presence_of :duration}
    it { should validates_presence_of :date}
    it { should validates_presence_of :start_time}
  end

  describe 'relationship' do 

    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end
end