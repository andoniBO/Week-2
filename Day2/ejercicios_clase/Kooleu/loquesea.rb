require 'sinatra'
require "sinatra/reloader" if development? 



#set :haml, :format => :html5
configure do
	@@today = Date.today
end
get "/hours/ago/:hours_ago" do
	@hours = params[:hours_ago]
	erb(:hours)
end

get "/" do
	"My first Sinatra app."
end

get "/tonta" do
	erb(:tonta)
end

get '/puertas/:name/:date_of_birth' do
	@name = params[:name]
	@date_of_birth = params[:date_of_birth]
	erb(:more_than_18)
end