class User < ApplicationRecord
  has_many :hosted_parties, :class_name => "ViewingParty", foreign_key: "host_id" 
  has_many :viewing_party_users
  has_many :invited_parties, through: :viewing_party_users, :source => :user
end
