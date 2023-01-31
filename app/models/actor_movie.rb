class ActorMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :actor

  validates_presence_of :character
end
