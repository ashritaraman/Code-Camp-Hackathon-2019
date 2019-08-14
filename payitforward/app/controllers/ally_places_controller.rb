class AllyPlacesController < ApplicationController
  before_action :set_place
  before_action :set_ally_place, only: [:show, :edit, :update, :destroy]

  # GET places/1/ally_places
  def index
    @ally_places = @place.ally_places
  end

  # GET places/1/ally_places/1
  def show
  end

  # GET places/1/ally_places/new
  def new
    @ally_place = @place.ally_places.build
  end

  # GET places/1/ally_places/1/edit
  def edit
  end

  # POST places/1/ally_places
  def create
    @ally_place = @place.ally_places.build(ally_place_params)

    if @ally_place.save
      redirect_to([@ally_place.place, @ally_place], notice: 'Ally place was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT places/1/ally_places/1
  def update
    if @ally_place.update_attributes(ally_place_params)
      redirect_to([@ally_place.place, @ally_place], notice: 'Ally place was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE places/1/ally_places/1
  def destroy
    @ally_place.destroy

    redirect_to place_ally_places_url(@place)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:place_id])
    end

    def set_ally_place
      @ally_place = @place.ally_places.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ally_place_params
      params.require(:ally_place).permit(:name, :latitude, :longitude, :donation, :description)
    end
end
