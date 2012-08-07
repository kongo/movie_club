class Poll < ActiveRecord::Base
  attr_accessible :ends_at, :starts_at, :title
  after_initialize :default_values
  has_many :options

  OPTIONS_COUNT = 4

  def build_options_from_movies_urls(movies_urls)
    movies_urls.each do |url|
      self.options.build({ movie: MovieFinder.find_by_url(url) })
    end
  end

  private

  def default_values
    self.title ||= "Choice for " + Date.commercial(Date.today.year, Date.today.cweek, 4).to_s(:long_ordinal)
    unless self.options.count > 0
      1.upto(OPTIONS_COUNT) do |i|
        option = self.options.build
        option.movie = Movie.new
      end
    end
  end
end
