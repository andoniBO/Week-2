require 'imdb'
require 'pry'



#i = Imdb::Search.new("Rambo")


#puts i.movies[0].class

# i.movies.each do |item|
#   puts item
# end

class Fake_imdb
  attr_reader :fake_imdb_db
  def initialize
    index = 0
    @fake_imdb_db = Array.new
    (0..15).each do |i|
     # if rand(2)%2 == 0
        title = "titulo" + index.to_s
     # else
     #   title = nil
     # end
      i = Imdb::Movie.new(index)
      i.title = title
      #i.poster.src = "http://www.oldkingjames.com/RUBY_LESSONS/ruby_lesson39/image2_ruby_lesson39.PNG"
      @fake_imdb_db.push(i)
      #puts i.title
      index += 1
    end
  end

  def search_nine(title)
    #imdb_search = Imdb::Search.new(title)
    #search_array= @fake_imdb_db.first(9)
    search_array = Array.new
    @fake_imdb_db.each do |film|
      if film.poster != nil && search_array.size < 9
        search_array.push(film)
      end
    end
    search_array
  end
end