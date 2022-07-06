class User < ApplicationRecord
  has_many :attendees
  has_many :viewing_partys, through: :attendees
end
