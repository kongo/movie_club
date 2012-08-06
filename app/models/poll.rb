class Poll < ActiveRecord::Base
  attr_accessible :ends_at, :starts_at, :title
end
