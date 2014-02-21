class RentalsController < ApplicationController
   def index
     @rental=Rental.all
   end
  def show
   @rental=Rental.find(params[:id])
  end
  def new
    
  end
  def create
    @rental = Rental.new(params[:rental].permit(:phone_num,:moviename))
   mobileno_exist= Customer.find_by_mobile_number(params[:rental][:phone_num])
   moviename_found=Rental.find_by_moviename(params[:rental][:moviename])
   moviename_exist=Movie.find_by_movie_name(params[:rental][:moviename])
   movie_count=Rental.where(:phone_num => params[:rental][:phone_num]).count
   
     if !mobileno_exist
       flash[:error] = "Mobile num not exist"
       render 'new'
     elsif !moviename_exist
       flash[:error] = "movie name not exist"
       render 'new'
     elsif movie_count== 5
         flash[:error] = "limit exceeded"
         render 'new'
     elsif moviename_found
         flash[:error] = "movie currently no available"
         render 'new'
     else
         if @rental.save
           redirect_to @rental
         else
           render 'new'
         end
     end
  end
  
def destroy
  @rental = Rental.find(params[:id])
  @rental.destroy
 
  redirect_to rentals_path
end
private
   def post_params
    params.require(:rental).permit(:phone_num,:moviename)
  end
end
