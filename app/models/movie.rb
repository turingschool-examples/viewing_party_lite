class Movie < ApplicationRecord
  validates_presence_of :title,
                        :vote_average,
                        :run_time,
                        :genre,
                        :summary
                        
  has_many :cast_members
  has_many :reviews
  has_many :parties
end
