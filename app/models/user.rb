class User < ApplicationRecord
  has_many :view_parties
  has_many :invites
end
