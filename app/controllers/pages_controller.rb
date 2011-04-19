class PagesController < ApplicationController
  def home
  @title = "Home"
  @logo = "logo.png" 
  end

  def contact
  @title = "Contact" 
  @logo = "logo.png"
  end
  
  def about
  @title = "About" 
  @logo = "logo.png"
  end

  def help
  @title = "Help"
  @logo = "logo.png"
  end
end
