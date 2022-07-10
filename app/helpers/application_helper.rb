module ApplicationHelper
  def find_movie(id)
    MovieFacade.new.movie_details(id)
  end
end
