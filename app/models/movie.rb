class Movie < ActiveRecord::Base
  attr_accessible :director, :imdb_id, :imdb_rating, :imdb_votes_count, :length, :mpaa_rating, :plot, :poster_url, :title, :trailer_url, :year
end
