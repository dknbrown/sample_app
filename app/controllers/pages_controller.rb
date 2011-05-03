class PagesController < ApplicationController
  def home
  @title = "Home"
  @logo = "logo.png" 
  if signed_in?
    @micropost = Micropost.new if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page])
  end
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
