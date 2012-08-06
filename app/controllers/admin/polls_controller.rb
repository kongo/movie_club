class Admin::PollsController < ApplicationController
  inherit_resources
  before_filter :authorize

  def new
    new! do
      1.upto(4) { |i| @poll.options.build({movie_url: "imdb-#{i}" }) }
      @options = @poll.options
    end
  end

  def create
    options_attributes = params[:poll].delete :options_attributes
    @poll = Poll.new(params[:poll])
    build_options_from_params(options_attributes)
    @poll.save
  end

  private

  def build_options_from_params(params)
    @poll.options = []
    params.inject([]) do |s, n|
      movie   = MovieFinder.find_by_url n[1][:movie_url]
      option  = @poll.options.build({movie: movie})
      s + [option]
    end
  end

  def authorize
    raise '403' unless user_signed_in? && current_user.is_admin?
  end
end