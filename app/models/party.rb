class Party < ApplicationRecord
    validates_presence_of :duration, :when, :start_time

    belongs_to :user 
    has_many :user_parties
    has_many :users, through: :user_parties
end 