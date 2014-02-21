class AddIndexToMoviesMovieName < ActiveRecord::Migration
  def change
    add_index :movies, :movie_name
  end
end
