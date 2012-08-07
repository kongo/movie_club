class Option < ActiveRecord::Base
  belongs_to :movie
  belongs_to :poll
  validates_presence_of :movie
  validates_presence_of :poll
  attr_accessor :movie_url
  attr_accessible :movie_url
  after_initialize :default_values

  def default_values
    movie ||= Movie.new
  end

end
