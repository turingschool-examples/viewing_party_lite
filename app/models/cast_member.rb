class CastMember < ApplicationRecord
  validates_presence_of :name,
                        :stage_name
  belongs_to :movie
end
