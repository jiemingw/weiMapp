class WeisController < ApplicationController
  before_action :set_wei, only: [:show, :edit, :update, :destroy]

  # GET /weis
  # GET /weis.json
  def index
    @weis = Wei.all
  end

  # GET /weis/1
  # GET /weis/1.json
  def show
  end

  # GET /weis/new
  def new
    @wei = Wei.new
  end

  # GET /weis/1/edit
  def edit
  end

  # POST /weis
  # POST /weis.json
  def create
    @wei = Wei.new(wei_params)

    respond_to do |format|
      if @wei.save
        format.html { redirect_to @wei, notice: 'Wei was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wei }
      else
        format.html { render action: 'new' }
        format.json { render json: @wei.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weis/1
  # PATCH/PUT /weis/1.json
  def update
    respond_to do |format|
      if @wei.update(wei_params)
        format.html { redirect_to @wei, notice: 'Wei was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wei.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weis/1
  # DELETE /weis/1.json
  def destroy
    @wei.destroy
    respond_to do |format|
      format.html { redirect_to weis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wei
      @wei = Wei.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wei_params
      params.require(:wei).permit(:User, :latitude, :longitude, :address, :description, :title)
    end
end
