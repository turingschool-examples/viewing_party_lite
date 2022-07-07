class User < ApplicationRecord
  has_many :attendees
  has_many :viewing_partys, through: :attendees
  validates_presence_of :user_name, :email
  validates_uniqueness_of :email
end
