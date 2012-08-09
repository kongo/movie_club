class Option < ActiveRecord::Base
  belongs_to :movie
  belongs_to :poll
  has_many :votes
  validates_presence_of :movie
  validates_presence_of :poll
  attr_accessible :movie_id
end
