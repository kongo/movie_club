class Admin::PollsController < ApplicationController
  inherit_resources
  before_filter :authorize

  def create
    @poll = Poll.create(params[:poll])
    @poll.options.each { |o| o.poll = @poll }
    if @poll.save
      redirect_to admin_polls_path
    else
      render "admin/polls/new"
    end
  end

  private

  def authorize
    raise '403' unless user_signed_in? && current_user.is_admin?
  end
end