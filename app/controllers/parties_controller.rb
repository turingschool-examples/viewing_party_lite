# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @party = Party.new
  end


  private

  def party_params
    # params.permit(:name, :email)
  end
end
