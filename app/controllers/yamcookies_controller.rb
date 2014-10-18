class YamcookiesController < ApplicationController
  
    def set_cookies
        cookies[:y_new_token]   = "test-cookies" 
      render :text => "set"
   
  end
  
  def show_cookies
   @y_new_token    = cookies[:y_new_token]
  end
  
  def delete_cookies
    cookies.delete :y_new_token
   
  end
end