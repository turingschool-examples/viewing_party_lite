class PeopleController < ApplicationController
  def new
    @person = 
  end

  def create
    person = Person.new(person_params)
    person.save
    redirect_to root_path
  end

  private

  def person_params
    params.permit(:name, :email)
  end
end
