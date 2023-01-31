class DeleteActorMovies < ActiveRecord::Migration[5.2]
  def change
    drop_table :actor_movies
  end
end
