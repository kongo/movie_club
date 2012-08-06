class Admin::PollsController < ApplicationController
  inherit_resources
  before_filter :authorize

  private

  def authorize
    raise '403' unless user_signed_in? && current_user.is_admin?
  end
end