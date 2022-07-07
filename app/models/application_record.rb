# frozen_string_literal: true

# Need comment to shut rubocop up?
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
