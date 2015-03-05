class AttractionsController < ApplicationController
  require 'json'
  require 'yelp'
  require 'oauth'

  def new
  	@attraction = Attraction.new
    @attraction.name = params[:name]
    @attraction.description = params[:description]
    @attraction.trip_id = params[:trip_id]
    @attraction.url = params[:url]
  end

  def create
    puts params
    safe_attraction = params.require(:attraction).permit(:name, :description, :trip_id, :url)
    @attraction = Attraction.new safe_attraction
    @attraction.name = params[:attraction][:name]
    @attraction.description = params[:attraction][:description]
    @attraction.trip_id = params[:attraction][:trip_id]
    @attraction.url = params[:attraction][:url]
    @attraction.save

    @trip = Trip.find_by(id: params[:attraction][:trip_id])
    redirect_to @trip

    puts @attraction
    puts @city
  	
  end

  def show
  end

  def search
    @trip_id = params[:trip_id]
    trip = Trip.find(@trip_id)
    @city = trip.city.name
    @term = params[:term]
    params = { term: @term, 
      limit: 20,
      sort: 2
    }
    @yelp_data = JSON.parse(Yelp.client.search(@city, params).to_json())
    @output = @yelp_data["businesses"]
    @term = @term.pluralize.capitalize
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    redirect_to trip_path(params[:trip_id]), notice: "Attraction removed!"
  end

end
