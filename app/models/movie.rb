class Movie < ApplicationRecord
  has_many :viewing_parties, dependent: :destroy
  
  validates :title, presence: true
  validates :runtime, presence: true
  validates :genre, presence: true
  validates :summary, presence: true
end