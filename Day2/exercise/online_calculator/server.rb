# server.rb
require 'sinatra'
require 'sinatra/reloader' if development? 

require './lib/Calculator.rb'
require 'pry'

#set :haml, :format => :html5

get '/add' do
	erb(:add)
end

post '/post_result' do
	if File.exist?("./public/lastresult.txt")
		@first = IO.read("./public/lastresult.txt").to_f
	else
		@first = params[:first_number].to_f
	end
	@second = params[:second_number].to_f
	@operation = params[:operation].to_s #.=>"addition"
	case @operation
		when "add"
			@result = Calculator.add(@first,@second)
			IO.write("./public/lastresult.txt", @result)
			#{}"#{@first}  +  #{@second}  =  #{@result}"
			erb(:result)
		when "subtract"
			@result = Calculator.subtract(@first,@second)
			IO.write("./public/lastresult.txt", @result)
			#{}"#{@first}  -  #{@second}  =  #{@result}"
			erb(:result)
		when "multiply"
			@result = Calculator.multiply(@first,@second)
			IO.write("./public/lastresult.txt", @result)
			#{}"#{@first}  x  #{@second}  =  #{@result}"
			erb(:result)
		when "divide"
			@result = Calculator.divide(@first,@second)
			IO.write("./public/lastresult.txt", @result)
			#{}"#{@first}  /  #{@second}  =  #{@result}"
			erb(:result)
	end
end
