class MovieFinder
  def self.find_by_url(url)
    matches = url.match(/(\d+)/)
    return nil unless matches

    imdb_id = matches[0]
    return nil unless imdb_id

    movie = Movie.find_by_imdb_id(imdb_id)
    return movie if movie

    imdb_movie = Imdb::Movie.new(imdb_id)
    return nil unless imdb_movie.title

    Movie.create({
      imdb_id:          imdb_id,
      title:            imdb_movie.title,
      director:         imdb_movie.director,
      length:           imdb_movie.length,
      mpaa_rating:      imdb_movie.mpaa_rating,
      plot:             imdb_movie.plot,
      poster_url:       imdb_movie.poster,
      imdb_rating:      imdb_movie.rating,
      trailer_url:      imdb_movie.trailer_url,
      year:             imdb_movie.year,
      imdb_votes_count: imdb_movie.votes
    })
  end
end