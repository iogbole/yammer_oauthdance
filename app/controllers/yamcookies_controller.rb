class YamcookiesController < ApplicationController
    #this class is used to test cookie/session behaviour 
    def set_cookies
        session[:y_new_token]   = "test-cookies" 
      render :text => "set"
   
  end
  
  def show_cookies
   @y_new_token    = session[:y_new_token]
  end
  
  def delete_cookies
    cookies.delete :y_new_token
   
  end
end