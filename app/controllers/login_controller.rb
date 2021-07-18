class LoginController < ApplicationController

  def new
  	
  	if session[:user]
  		redirect_to :controller => "dns_entries", :action => :index

  	end
	
  end

  def create

  	begin
  	@response = RestClient.get('https://api.cloudflare.com/client/v4/zones/', content_type: 'application/json', accept: :json, :'x-auth-key' => params[:cloudfare][:token], :'x-auth-email' => params[:cloudfare][:email])
  	if @response
  		@info = JSON.parse(@response.body)["success"]
	 	if @info
	 		session[:user] = true
	 		session[:key] = params[:cloudfare][:token]
	 		session[:email] = params[:cloudfare][:email]
	 		flash[:message] = "Authenticated successfully"
	     redirect_to :controller => "dns_entries", :action => :index
	   	else
	     render json: "Something went wrong"
		end
  	else
  		render json: "Error"
  	end	
	rescue => e
		flash[:message] = "Incorrect credentials"
  		redirect_to :controller => :login, :action => :new
	end 
  end

  def logout
  	session.clear
  	flash[:message] = "Logged out successfully"
  	redirect_to :controller => :login, :action => :new
  end

end
