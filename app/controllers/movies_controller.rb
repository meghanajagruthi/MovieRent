class MoviesController < ApplicationController
 
 def show
   @movie=Movie.find(params[:id])
 end
  
 def new
   
 end
 def create
   @movie = Movie.new(post_params)
   @movie.save
   redirect_to @movie
 end
   def edit
   @movie = Movie.find(params[:id])
  end
  
 def index
  @movie = Movie.all
 end
 def update
  @movie = Movie.find(params[:id])
 
  if @movie.update(params[:movie].permit(:movie_name, :Language, :release_date, :type_of_movie))
    redirect_to @movie
  else
    render 'edit'
  end
end
  def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
 
  redirect_to movies_path
end
  private
   def post_params
    params.require(:movie).permit(:movie_name, :Language, :release_date, :type_of_movie)
  end
end
