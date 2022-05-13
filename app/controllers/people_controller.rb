class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new(person_params)
  end

  def create
    person = Person.new(person_params)
    person.save
    redirect_to person_path(person.id)
  end

  def discover
    @person = Person.find(params[:id])
  end

  def movies
    movie = params[:movie]
    @movie_names = MoviesFacade.titles(movie)
  end

  private

  def person_params
    params.permit(:id, :name, :email)
  end
end
