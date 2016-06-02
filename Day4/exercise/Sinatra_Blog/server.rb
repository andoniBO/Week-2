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
id = 0
blog.add_post Post.new('Titulo1', 'Texto asdkajdasidjasidjaspdjaspodjasdopjasopdjasojdoasjodpjsapodjoaspdoajdosjpdaosjdopasojdsapo', id, Date.new(2001, 5, 2))
id += 1
blog.add_post Post.new('Titulo2', 'Texto asdkajdasidjasidjaspdjaspodjasdopjasopdjasojdoasjodpjsapodjoaspdoajdosjpdaosjdopasojdsapo', id, Date.new(2005, 5, 2))
id += 1
blog.add_post Post.new('Titulo3', 'Texto asdkajdasidjasidjaspdjaspodjasdopjasopdjasojdoasjodpjsapodjoaspdoajdosjpdaosjdopasojdsapo', id, Date.new(2008, 5, 2))

get '/' do
  blog.latest_posts
  @posts = blog.posts
  haml(:index)
end

get '/post_details/:id' do
  @id = params[:id]
end

