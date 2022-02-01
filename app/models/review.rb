class Review < ApplicationRecord
  validates_presence_of :author,
                        :critique
                        
  belongs_to :movie
end
