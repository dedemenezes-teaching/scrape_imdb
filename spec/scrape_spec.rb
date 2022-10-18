require_relative '../scrape.rb'
# think about new method
# name ? top_movies
# parameters or not?
# return of the method?

RSpec.describe '#top_movies' do
  it 'returns an array of movies urls' do
    url = 'https://www.imdb.com/chart/top'
    actual = top_movies(url)
    expected = [
      "/title/tt0111161/",
      '/title/tt0068646/',
      '/title/tt0468569/',
      '/title/tt0071562/',
      '/title/tt0050083/'
    ]
    expect(actual).to eq(expected)
  end
end

RSpec.describe "#scrape_movie" do
  it 'return a Hash describing a movie' do
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie('https://www.imdb.com/title/tt0468569/')

    expect(actual).to eq(expected)
  end
end
