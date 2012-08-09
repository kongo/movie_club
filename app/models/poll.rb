class Poll < ActiveRecord::Base
  attr_accessible :ends_at, :starts_at, :title, :options, :options_attributes
  after_initialize :default_values

  has_many :options,  :dependent => :destroy
  has_many :votes,    :dependent => :destroy
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

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end

  def votes_percent(option)
    (votes.with_option(option).count.to_f / votes.count * 100).round
  end

  def votes_count(option)
    (option ? votes.with_option(option) : votes).count
  end

  def leading_option
    votes.count(:group => :option).max_by {|k,v| v} [0]
  end

  def leading_option?(option)
    option == leading_option
  end

  private

  def default_values
    target_date   = Date.commercial(Date.today.year, Date.today.cweek, 4)
    self.title    ||= "Choice for " + target_date.to_s(:long_ordinal)
    self.starts_at = Time.zone.now
    self.ends_at  ||= (target_date - 1.day).to_datetime.in_time_zone.change({hour: 16, min: 30})
  end
end
