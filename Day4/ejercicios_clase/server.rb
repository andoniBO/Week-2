require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './lib/post.rb'
require_relative './lib/blog.rb'

set :haml, format: :html5

enable(:sessions)

# configure do
# @@today = Date.today
# end

blog = Blog.new
blog.add_post Post.new("Titulo", "Texto asdkajdasidjasidjaspdjaspodjasdopjasopdjasojdoasjodpjsapodjoaspdoajdosjpdaosjdopasojdsapo")

get '/' do
  haml(:index)
end

