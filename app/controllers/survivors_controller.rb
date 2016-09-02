class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy, :update_location]

  # GET /survivors
  def index
    @survivors = Survivor.all

    render json: @survivors
  end

  # GET /survivors/1
  def show
    render json: @survivor
  end

  # POST /survivors
  def create
    @survivor = Survivor.new(survivor_params)

    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /survivors/update_location
  def update_location
    if @survivor.update(lat: params[:lat].to_s, long: params[:long].to_s)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /survivors/1
  def update
    if @survivor.update(survivor_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survivors/1
  def destroy
    @survivor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :lat, :long, :infected_reports)
    end

    # Only allow a trusted parameter "white list" through.
    def update_location_params
       params.permit(:id, :lat, :long)      
    end
end
