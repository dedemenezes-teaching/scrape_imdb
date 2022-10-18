require 'yaml'
require_relative 'scrape'

puts "Fetching TOP 5 movies from IMDB"

urls = top_movies('https://www.imdb.com/chart/top')

movies = []

urls.each do |url|
  # "/title/tt0111161/",
  movies << scrape_movie("https://www.imdb.com#{url}")
end

File.write('movies.yml', movies.to_yaml)

puts "Movies saved!"
puts "Check your file!"
