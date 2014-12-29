class SiteController < ApplicationController
  
  def home    
    @categories = Category.all
  end

  def about
  end

  def help
  end
  

  
end
