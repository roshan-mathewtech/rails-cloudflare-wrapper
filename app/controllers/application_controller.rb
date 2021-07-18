class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning

	require 'json'
	require 'net/http'
	require 'rest-client'

 def authenticate
 	unless session[:user]
 		flash[:message] = "Log in to continue"
 		redirect_to :controller => :login, :action => :new 	
 	end
 end

end
