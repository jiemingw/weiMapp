class WeiUsersController < ApplicationController
  before_action :set_wei_user, only: [:show, :edit, :update, :destroy]

  # GET /wei_users
  # GET /wei_users.json
  def index
    @wei_users = WeiUser.all
    @hash = Gmaps4rails.build_markers(@wei_users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  # GET /wei_users/1
  # GET /wei_users/1.json
  def show
  end

  # GET /wei_users/new
  def new
    @wei_user = WeiUser.new
  end

  # GET /wei_users/1/edit
  def edit
  end

  # POST /wei_users
  # POST /wei_users.json
  def create
    @wei_user = WeiUser.new(wei_user_params)

    respond_to do |format|
      if @wei_user.save
        format.html { redirect_to @wei_user, notice: 'Wei user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wei_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @wei_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wei_users/1
  # PATCH/PUT /wei_users/1.json
  def update
    respond_to do |format|
      if @wei_user.update(wei_user_params)
        format.html { redirect_to @wei_user, notice: 'Wei user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wei_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wei_users/1
  # DELETE /wei_users/1.json
  def destroy
    @wei_user.destroy
    respond_to do |format|
      format.html { redirect_to wei_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wei_user
      @wei_user = WeiUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wei_user_params
      params.require(:wei_user).permit(:latitude, :longitude, :address, :description, :title)
    end
end
