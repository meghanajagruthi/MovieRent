class CustomersController < ApplicationController
  def index
  @customer = Customer.all
  end
  def show
   @customer=Customer.find(params[:id])
 end
 
  def new
    
  end
  def create
   @customer = Customer.new(post_params)
   @customer.save
   redirect_to @customer
  end
 
 def edit
  @customer = Customer.find(params[:id])
 end
def update
  @customer = Customer.find(params[:id])
 
  if @customer.update(params[:customer].permit(:Name, :mobile_number, :email, :address))
    redirect_to @customer
  else
    render 'edit'
  end
end
  def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
 
  redirect_to customers_path
end
 private
   def post_params
    params.require(:customer).permit(:Name, :mobile_number, :email, :address)
  end
end
