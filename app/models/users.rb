class Users
  include HTTParty

  def self.response
   
     api_token = cookies[:y_new_token]
     puts "get cooke: #{api_token}"
    endpoint="https://api.yammer.com/api/v1/users.json"
    token_string="Bearer #{api_token}"
      puts token_string;
      HTTParty.get(endpoint, :headers => { "Content-Type" => 'application/json', "Authorization" => token_string} )
  end
    
    
    
    def setCookie
        
        cookies[:y_token] = { :value => "XaDeZVm17DdbtD5WzddxvA", :expires => Time.now + 3600}
        
    end
    
    def getCookie
        
    
    end

end