class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
end