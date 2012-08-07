class Admin::PollsController < ApplicationController
  inherit_resources
  before_filter :authorize

  def create
    raise params.inspect
    movies_urls = params[:poll].delete(:options).map{ |e| e[1][:movie_url] }
    @poll = Poll.new(params[:poll])
    @poll.build_options_from_movies_urls movies_urls
    @poll.save
  end

  private

  def authorize
    raise '403' unless user_signed_in? && current_user.is_admin?
  end
end