class Poll < ActiveRecord::Base
  attr_accessible :ends_at, :starts_at, :title, :options, :options_attributes
  after_initialize :default_values

  has_many :options
  accepts_nested_attributes_for :options

  default_scope ->{ order("ends_at desc") }

  def build_options_from_movies_urls(movies_urls)
    movies_urls.each do |url|
      self.options.build({ movie: MovieFinder.find_by_url(url) })
    end
  end

  private

  def default_values
    self.title    ||= "Choice for " + Date.commercial(Date.today.year, Date.today.cweek, 4).to_s(:long_ordinal)
    self.ends_at  ||= Date.commercial(Date.today.year, Date.today.cweek, 4) - 1.day
  end
end
