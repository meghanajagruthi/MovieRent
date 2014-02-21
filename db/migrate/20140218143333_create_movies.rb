class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :Language
      t.integer :release_date
      t.string :type_of_movie

      t.timestamps
    end
  end
end
