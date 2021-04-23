class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  # GET /estates or /estates.json
  def index
    @estates = Estate.all
  end

  # GET /estates/1 or /estates/1.json
  def show
    @station = @estate.stations
  end

  # GET /estates/new
  def new
    @estate = Estate.new
    2.times {@estate.stations.build}
  end

  # GET /estates/1/edit
  def edit
    @estate_plus = Estate.new
    @estate.station.build
  end

  # POST /estates or /estates.json
  def create
    @estate = Estate.new(estate_params)

    # respond_to do |format|
      if @estate.save
        redirect_to estate_path, notice: 'estate ws successfully created'
        # format.html { redirect_to @estate, notice: "Estate was successfully created." }
        # format.json { render :show, status: :created, location: @estate }
      else
        render :new
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /estates/1 or /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        redirect_to estates_path, notice: 'estate was successfully updated.'
        # format.html { redirect_to @estate, notice: "Estate was successfully updated." }
        # format.json { render :show, status: :ok, location: @estate }
      else
        render :edit
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1 or /estates/1.json
  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: "Estate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estate_params
      params.require(:estate).permit( :name, :rent, :address, :age, :note, station_attributes: [:id, :line_name, :station_name, :walking_time, :estate_id])
    end
end
