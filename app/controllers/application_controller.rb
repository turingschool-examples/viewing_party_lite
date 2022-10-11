# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
