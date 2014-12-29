class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('name')
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action=> 'index')
      flash[:success]="new category successfully created"
    else
      render 'new'
      flash[:error]="error encountered creating new categories"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => @category.id)
    else
      render 'index'
    end
  end

  def delete
    @category = Category.find(params[:id])
  end
  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
  
  private
  def category_params
    params.require(:category).permit(:name,:description)
  end
end

