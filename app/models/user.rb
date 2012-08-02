class User < ActiveRecord::Base
  devise :rememberable, :trackable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.login(params)
    nil
  end
end
