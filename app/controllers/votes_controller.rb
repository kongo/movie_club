class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @poll = Poll.find params[:poll_id]
    @option = @poll.options.find params[:vote][:option_id]
    @vote = @poll.votes.build user: current_user, option: @option
    @vote.save!
    flash[:notice] = "Your vote has been accepted"
    redirect_to polls_path
  end

end