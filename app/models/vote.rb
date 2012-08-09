class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :option
  attr_accessible :user, :option

  scope :with_option, ->(option) { where(option_id: option.id) }
end
