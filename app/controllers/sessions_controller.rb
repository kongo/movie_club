class SessionsController < ApplicationController

  include Devise::Controllers::Rememberable

  def new
    # empty 
  end

  def create
    if user = UserFinder.find(params[:user][:username], params[:user][:password])
      sign_in user
      remember_me user
      redirect_to root_path
    else
      flash[:error] = 'Username or password is incorrect :('
      render template: "sessions/new"
    end
  end

end
