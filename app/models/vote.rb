class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :option
  attr_accessor :will_attend
  attr_accessible :will_attend
  attr_accessible :user, :option

  validates_presence_of :user
  validates_presence_of :option
  validates :will_attend, :inclusion => {:in => ["1", :"1", 1]}

  scope :with_option, ->(option) { where(option_id: option.id) }
end
