require 'rails_helper'

RSpec.describe User do 
  it {should validate_presence_of :name }
  it {should validate_presence_of :email }
  it {should validate_uniqueness_of :email }
  # it {should validate_presence_of :password }
  it {should have_secure_password }

  it { should have_many :user_viewing_parties }
  it { should have_many(:viewing_parties).through(:user_viewing_parties) }

end