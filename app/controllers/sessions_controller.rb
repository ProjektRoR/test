class SessionsController < ApplicationController
  def new
    @title_page = "zaloguj"
  end

  def create
    @title_page = "zaloguj"
    user = User.find_by_mail(params[:session][:mail].downcase)
    if user && User.find_by_password(params[:session][:password])
      log_in user
#      redirect_to user
      redirect_back_or user
      flash[:success] = 'Pozytywne zalogowanie'
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
