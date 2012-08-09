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

  def open?
    Time.zone.now < self.ends_at
  end

  def closed?
    !self.open?
  end

  private

  def default_values
    target_date   = Date.commercial(Date.today.year, Date.today.cweek, 4)
    self.title    ||= "Choice for " + target_date.to_s(:long_ordinal)
    self.starts_at = Time.zone.now
    raise self.starts_at.class.inspect
    self.ends_at  ||= target_date.beginning_of_day
  end
end
