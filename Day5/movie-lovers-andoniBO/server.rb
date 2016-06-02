require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

require_relative './lib/fake_class.rb'
require_relative './lib/questions.rb'

set :haml, format: :html5

enable(:sessions)

# configure do
# @@today = Date.today
# end

imdb = Fake_imdb.new
questions = Questions.new
questions.add_question("Que pelicula es del año 1999?", 1999)
questions.add_question("Que pelicula es del año 1999?", 1999)
questions.add_question("Que pelicula es del año 1999?", 1999)

def search_film(title)
  imdb = Fake_imdb.new
  movies = imdb.search_nine(session[:title])
  film_index = movies.index(title)
  #binding.pry
  movies[film_index]
end

get '/' do
  haml(:index)
end

post '/search_top_nine' do
  session[:title] = params[:title]
  redirect to(:quiz)
end

get '/quiz' do
  @movies = imdb.search_nine(session[:title])
  @random_question = questions.question_array[rand(questions.question_array.size) - 1]
  #binding.pry
  haml(:quiz) 
end

get '/check_answer/:movie_title/:question_id' do
  film = search_film(params[:movie_title])
  if film.release_date == questions[params[:question_id]][:answer]
    redirect to(:player_evaluation)
  else
    redirect to(:quiz)
  end
end

get '/player_evaluation' do

end