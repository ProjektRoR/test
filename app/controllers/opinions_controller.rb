class OpinionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @opinion = current_user.opnions.build(params[:opinion])
    if @opinion.save
      flash[:success] = "dodano komentarz"
      redirect_to root_path
    else
      render "static_pages/home"
    end
  end

  def destroy

  end
end
