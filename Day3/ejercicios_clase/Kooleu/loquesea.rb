require 'sinatra'
require "sinatra/reloader" if development? 

enable(:sessions)

set :haml, :format => :html5

#configure do
#	@@today = Date.today
#end
get "/hours/ago/:hours_ago" do
	@hours = params[:hours_ago]
	session[:hours] = @hours
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

get '/club_entrance' do
	if(session[:user])
		@user = session[:user]
		@age = session[:age]
		@vip = session[:vip]
	end
	haml(:club_entrance)
end

get '/menu' do
	option = params[:option].to_s
	case option
		when "log_in"
			redirect to(:log_in)
		when "profile"
			redirect to(:profile)
		when "join_list"
			redirect to(:join_list)
	end
end

get '/log_in' do
	haml(:login)
end

get '/profile' do
	@user = session[:user]
	@age = session[:age]
	haml(:profile)
end

get '/join_list' do
	haml(:join_list)
end

post '/join_VIP' do
	session[:vip] = true
	session[:user] = params[:user]
	session[:age] = Time.new.year - params[:date_of_birth].to_i
	redirect to(club_entrance)
end

post '/check_login' do
	session[:user] = params[:user]
	session[:age] = Time.new.year - params[:date_of_birth].to_i
	redirect to(:validate)
end

get '/validate' do
	#@user = session[:user]
	#@age = session[:age]
	haml(:validate)
end