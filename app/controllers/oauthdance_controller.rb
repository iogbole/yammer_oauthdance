class OauthdanceController < ApplicationController

  LOGIN_URL = %{https://www.yammer.com/dialog/oauth?client_id=%s&redirect_uri=%s://%s/consume} 
  TOKEN_URL = %{https://www.yammer.com/oauth2/access_token.json?client_id=%s&client_secret=%s&code=%s} 
  APP_ID = 'nfeHCYBY4uEpNjn4Ww4hA'
  APP_SECRET = 'limDO13SsaATwMgaU8EXkuLhdEZpP6RVre43CMnlA'

  def login 

      redirect_to LOGIN_URL % [ APP_ID, request.scheme, request.host_with_port]
  end

  def consume
    code = params[:code]
    if params[:code]
      token = get_token(APP_ID, APP_SECRET, code)
    end

    #cookies[:y_new_token] = token
    session[:y_new_token] = token
    puts  "token is : #{token} "

    # render :text => token
    redirect_to "/ng"
      
  end

  def get_token(client_id, client_secret, code)
    j_response = HTTParty.get(TOKEN_URL % [client_id, client_secret, code])
    if !j_response.blank?
    json     = JSON.parse(j_response.body)
    json['access_token']['token']
    else
       redirect_to "/login"   
  end
  end
end