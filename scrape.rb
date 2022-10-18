require 'open-uri'
require 'nokogiri'

def top_movies(url)
  # visit the url -> make an http request
  response_html = URI.open(url).read
  # parse the response_html
  html_doc = Nokogiri::HTML(response_html)
  # seearch for the necessary information
  movies_array = []
  html_doc.search('.titleColumn a').first(5).each do |element|
    movies_array << element.attribute('href').value
  end
  movies_array
end


def scrape_movie(url)
  # visit the url -> make an http request
  response_html = URI.open(url, "Accept-Language" => 'en-US').read
  # parse the response_html
  html_doc = Nokogiri::HTML(response_html)
  # seearch for the necessary information
  title = html_doc.search('h1').text
  year = html_doc.search('.ipc-link.ipc-link--baseAlt.ipc-link--inherit-color.sc-8c396aa2-1.WIUyh').first.text.to_i
  director = html_doc.search('.ipc-metadata-list__item:contains("Director") a').first.text
  cast = html_doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link').first(3).map do |element|
    element.text
  end

  storyline = html_doc.search('.sc-16ede01-2.gXUyNh').text
  { title: title, year: year, director: director, cast: cast, storyline: storyline }
end
