class WelcomeController < ApplicationController
  def index
    @people = Person.all
  end
end
