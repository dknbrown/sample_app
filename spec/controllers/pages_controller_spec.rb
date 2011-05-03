require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App "
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                    :content => @base_title + "| Home")
    end
    
  describe "GET 'HOME' with signed in user" do
    before(:each) do 
      @user = test_sign_in(Factory(:user)) 
      mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
      @mp = [mp1]
          end

    it "should have a sidebar with a micropost count" do
      get :home
      response.should have_selector("span.microposts", 
                    :content => @user.microposts.count.to_s)
    end

    it "should have proper plurazation 1 micropost" do
     get :home
      response.should have_selector("span.microposts", 
                    :content => "1 micropost")

    end

    it "should have proper plurazation 2 microposts" do
      mp2 = Factory(:micropost, :user => @user, :content => "Baz quux")
      get :home
      response.should have_selector("span.microposts", 
                    :content => "microposts")

    end

    it "should paginate" do
      50.times do
          Factory(:micropost, :user => @user, :content => "Foo bar")
      end
      get :home
      response.should have_selector("div.pagination")
      response.should have_selector("span.disabled", :content => "Previous")
      response.should have_selector("a", :href => "/?page=2",
                                           :content => "2")
        response.should have_selector("a", :href => "/?page=2",
                                           :content => "Next")
      
    end
      
    
  end    

  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                    :content => "Contact")
end

  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                    :content => @base_title + "| About")
    end

  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                    :content => @base_title + "| Help")
    end

  end


end
