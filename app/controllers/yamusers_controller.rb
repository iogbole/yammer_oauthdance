class YamusersController < ApplicationController

def index
 
   # cookies['y_token'] =  "XaDeZVm17DdbtD5WzddxvA"
   api_token = cookies[:y_new_token]
if !api_token.blank?
    puts "token is not bank.. going to party hard:  #{api_token}"
    endpoint="https://api.yammer.com/api/v1/users.json"
    token_string="Bearer #{api_token}"
    puts " Authorization header is #{token_string}";
    @response =  HTTParty.get(endpoint, :headers => { "Content-Type" => 'application/json', "Authorization" => token_string} )  
    
else
      puts "token is blank - redirecting to login"      
      redirect_to "/login"
end
end
end