class Option < ActiveRecord::Base
  belongs_to :movie
  belongs_to :poll
  attr_accessor :movie_url
  attr_accessible :movie_url, :movie
end
