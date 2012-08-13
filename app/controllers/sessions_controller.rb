class SessionsController < ApplicationController

  include Devise::Controllers::Rememberable

  def new
    # empty 
  end

  def create
    if user = UserFinder.find(params[:user][:username], params[:user][:password])
      remember_me user
      sign_in user
      redirect_to root_path
    else
      flash[:error] = 'Username or password is incorrect :('
      render template: "sessions/new"
    end
  end

end
