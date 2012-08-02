class SessionsController < ApplicationController

  def new
    # empty 
  end

  def create
    if user = User.login(params[:user])
      sign_in user
      redirect_to root_path
    else
      flash[:error] = 'Username or password is incorrect :('
      render template: "sessions/new"
    end
  end

end
