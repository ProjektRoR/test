class PublishingHousesController < ApplicationController
  # GET /publishing_houses
  # GET /publishing_houses.json
  def index
    @publishing_houses = PublishingHouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishing_houses }
    end
  end

  # GET /publishing_houses/1
  # GET /publishing_houses/1.json
  def show
    @publishing_house = PublishingHouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publishing_house }
    end
  end

  # GET /publishing_houses/new
  # GET /publishing_houses/new.json
  def new
    @publishing_house = PublishingHouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @publishing_house }
    end
  end

  # GET /publishing_houses/1/edit
  def edit
    @publishing_house = PublishingHouse.find(params[:id])
  end

  # POST /publishing_houses
  # POST /publishing_houses.json
  def create
    @publishing_house = PublishingHouse.new(params[:publishing_house])

    respond_to do |format|
      if @publishing_house.save
        format.html { redirect_to @publishing_house, notice: 'Publishing house was successfully created.' }
        format.json { render json: @publishing_house, status: :created, location: @publishing_house }
      else
        format.html { render action: "new" }
        format.json { render json: @publishing_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publishing_houses/1
  # PUT /publishing_houses/1.json
  def update
    @publishing_house = PublishingHouse.find(params[:id])

    respond_to do |format|
      if @publishing_house.update_attributes(params[:publishing_house])
        format.html { redirect_to @publishing_house, notice: 'Publishing house was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @publishing_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishing_houses/1
  # DELETE /publishing_houses/1.json
  def destroy
    @publishing_house = PublishingHouse.find(params[:id])
    @publishing_house.destroy

    respond_to do |format|
      format.html { redirect_to publishing_houses_url }
      format.json { head :no_content }
    end
  end
end
