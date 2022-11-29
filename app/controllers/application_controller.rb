# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def error_message(errors)
    errors.details.keys.map do |field|
      errors.full_messages_for(field).first
    end.join(", ") 
  end
end
