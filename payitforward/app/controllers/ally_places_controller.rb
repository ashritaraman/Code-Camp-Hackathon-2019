class AllyPlacesController < ApplicationController
  before_action :set_place
  before_action :set_ally_place, only: [:show, :edit, :update, :destroy]
  def root
    gon.ally_place = AllyPlace.all
  end
  # GET places/1/ally_places
  def index
    @ally_places = @place.ally_places
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
      redirect_to([@ally_place.place, @ally_place], notice: 'Your business was successfully added to the map! Thank you so much for making a difference.')
    else
      render action: 'new'
    end
  end

  # PUT places/1/ally_places/1
  def update
    if @ally_place.update_attributes(ally_place_params)
      redirect_to([@ally_place.place, @ally_place], notice: 'Your business information was successfully updated!')
    else
      render action: 'edit'
    end
  end

  # GET places/1/ally_places/1
  def show
  end

  # DELETE places/1/ally_places/1
  def destroy
    @ally_place.destroy

    redirect_to place_ally_places_url(@place)
  end

  # add in iterating through db to return lat and long
  AllyPlace = Struct.new(:name, :category, :hours_of_operation, :latitude, :longitude, :donation, :description)

  def dashboard
    @ally_place = AllyPlace.all.map do |ally_record|
      AllyPlace.new.tap do |ally|
        ally.name = ally_record.name
        ally.latitude = ally_record.latitude
        ally.longitude = ally_record.longitude
        ally.donation = ally_record.donation
        ally.description = ally_record.description
        ally.category = ally_record.category
        ally.hours_of_operation = ally_record.hours_of_operation
      end
    end
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
      params.require(:ally_place).permit(:name, :category, :hours_of_operation, :latitude, :longitude, :donation, :description,)
    end
end
