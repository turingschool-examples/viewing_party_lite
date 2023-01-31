class User < ApplicationRecord
  has_many :invitees
  has_many :viewing_parties, through: :invitees
end
