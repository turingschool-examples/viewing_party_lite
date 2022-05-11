class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new(person_params)
  end

  # def index
  #   @people = People.all
  #   require "pry"
  #   binding.pry
  # end
  #
  def create
    # require "pry"
    # binding.pry
    person = Person.new(person_params)
    person.save
    redirect_to person_path(person.id)
  end

  private

  def person_params
    params.permit(:id, :name, :email)
  end
end
