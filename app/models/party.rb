class Party < ApplicationRecord
  has_many :party_people
  has_many :people, through: :party_people

  validates_presence_of(:host_id)
  validates_presence_of(:movie_id)
  validates_presence_of(:movie_name)
  validates_presence_of(:date)
  validates_presence_of(:time)
  validates_presence_of(:duration)
end
