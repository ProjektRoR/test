class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_mail(params[:session][:mail].downcase)
    if user #&& user.find_by_password(params[:session][:password])
      log_in user
      redirect_to user
      flash[:success] = 'Pozytywne zalogowanie'
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
