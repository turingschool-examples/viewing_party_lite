class Party < ApplicationRecord
  validates_presence_of :day,
                        :start_time,
                        :duration
                        
  belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties 
end
