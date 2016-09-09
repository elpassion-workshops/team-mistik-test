uri = URI('https://raw.githubusercontent.com/mlabouardy/Rated-Movies/master/client/data/top-rated.json')
movies = Net::HTTP.get(uri)
parsed_movies = JSON.parse(movies)['movies']
parsed_movies.each do |movie|
  # movie['img']
  # movie['rating']
  # movie['title']
  # movie['year']
  # movie['tags'].each do |tag|
  #   tag['name']
  # end
  # movie['description']



  Movie.create!(title: movie['title'], description: movie['description'])
end
