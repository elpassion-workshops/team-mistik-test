movies_json_url = URI('https://raw.githubusercontent.com/mlabouardy/Rated-Movies/master/client/data/top-rated.json')
movies_json = Net::HTTP.get(movies_json_url)
movies = JSON.parse(movies_json)['movies']

Movie.destroy_all

movies.each do |movie|
  cover_url = movie['img']
  rating = movie['rating'].to_i
  title = movie['title']
  year = movie['year'].to_i
  tags = movie['tags'].map {|tag| tag['name']}
  description = movie['description']

  Movie.create!(title: title, description: description)
end
