# frozen_string_literal: true

# Application Parent Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
