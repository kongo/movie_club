class Poll < ActiveRecord::Base
  attr_accessible :ends_at, :starts_at, :title
  after_initialize :default_values

  has_many :options
  # accepts_nested_attributes_for :options

  private

  def default_values
    self.title ||= "Choice for " + Date.commercial(Date.today.year, Date.today.cweek, 4).to_s(:long_ordinal)
  end
end
