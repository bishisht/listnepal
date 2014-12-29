class BusinessesController < ApplicationController
  def index
    @businesses=Business.all
  end

  def new
    @business = Business.new
  end
  
  def create
    @business= Business.new(business_params)
    if @business.save
      redirect_to(:action=> 'index')
      flash[:success] = "Successfully created new business"
    else
      render 'new'
      flash[:error] = "Error encountered while creating new business."
    end    
  end

  def show
  end

  def edit
  end

  def delete
  end
  
  private
  def business_params
    params.require(:business).permit(:name,:address,:email,:district)
  end
end
