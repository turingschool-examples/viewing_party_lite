require 'rails_helper'

RSpec.describe Party, type: :model do
  it { should have_many(:user_parties) }
  it { should have_many(:users).through(:user_parties) }

  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:host) }  
  it { should validate_presence_of(:movie_id) } 
  it { should validate_presence_of(:movie_title) } 
end
