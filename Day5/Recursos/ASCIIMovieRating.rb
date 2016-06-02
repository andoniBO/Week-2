require 'imdb'
require 'pry'

movie_titles = Array.new
movie_titles = IO.read('movies.txt').split("\n")

movies = Array.new

movie_titles.each do |item|
#   puts item
    i = Imdb::Search.new(item)
    movie_rating = {:title => "", :rating => 0.0}
    movie_rating[:title] = i.movies[0].title
    movie_rating[:rating] = i.movies[0].rating
#   binding.pry
    movies.push(movie_rating)
#   puts movie_rating[:title]
end

(0..9).each do |item|
    movies.each do |item2|
        if(item2[:rating]>=10-item)
            print "|#"
        else
            print "| "
        end
     #  puts item2
     #  puts "#{item2[:rating]}"
    end
    print"|"
    puts ""
end

(1..20).each do |item|
    print "-"
end
puts ""

(1..10).each do |item|
    print "|#{item}"
end
print "| "
puts ""
puts ""

movies.each_with_index do |item2,index|
 #  puts item2
    puts "#{index+1}.#{item2[:title]}: #{item2[:rating]}"
end