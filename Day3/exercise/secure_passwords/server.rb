# server.rb
require 'sinatra'
require 'sinatra/reloader' if development? 

require './models/PasswordChecker.rb'
require 'pry'

#set :haml, :format => :html5

get '/' do
	haml(:index)
end

post '/password_checker' do
	#@user = params[:user]
	#@password = params[:password]
	if PasswordChecker.new.check_password(params[:user], params[:password])
		redirect to(:congratulations)
	else
		redirect to(:" ")
	end
end

get '/congratulations' do
	haml(:congratulations)
end