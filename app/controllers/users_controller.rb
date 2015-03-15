class UsersController < ApplicationController
  before_filter :logged_in_user, :only =>  [:index, :edit, :update, :destroy]
  before_filter :correct_user,   :only =>  [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @title_page = "Panel administracyjny"
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @title_page = "rejestracja"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title_page = "edytuj dane"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if params[:genre].nil?
      @user.favourite=" "
      else
        zmienna = " "
        params[:genre].each do |g|
          zmienna = zmienna + " " + g
        end
        @user.favourite=zmienna
    end

    @user.account_type="user"
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json

  def update
    @user = User.find(params[:id])
    if params[:genre].nil?

    else
      zmienna = " "
      params[:genre].each do |g|
        zmienna = zmienna + " " + g
      end
      @user.favourite=zmienna
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Udana zmiana danych' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

 def logged_in_user
   unless logged_in?
     store_location
     flash[:danger] = "Please log in."
     redirect_to login_path
   end

 end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def update_user_info
    @user = User.find(session[:temp])
    @user.account_type= params[:theme]
    if @user.update_attribute(:account_type, params[:theme])
      redirect_to users_path
    end

  end
end
