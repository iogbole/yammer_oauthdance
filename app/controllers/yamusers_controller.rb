class YamusersController < ApplicationController

 
 def index
   token_string_v = passSession;
  if !token_string_v.blank?
   endpoint="https://api.yammer.com/api/v1/users.json"
    @yamusers =  HTTParty.get(endpoint, :headers => { "Content-Type" => 'application/json', "Authorization" => token_string_v} )  
    #json     = JSON.parse(@yamusers.body)
    respond_to do |format|
    format.html
    format.json { render json: @yamusers }
    format.xml { render xml: @yamusers }
  end
      
  
  end

end
  
 def passSession
     
  #api_token = cookies[:y_new_token]
  api_token = session[:y_new_token]
    
if !api_token.blank?
  puts "token is not bank.. going to party hard:  #{api_token}"
  token_string="Bearer #{api_token}"
  puts " Authorization header is #{token_string}";
else
   puts "token is blank - redirecting to login"      
   redirect_to "/login"
end
  return token_string;
end
end