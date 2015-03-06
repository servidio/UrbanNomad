class TripsController < ApplicationController
	before_action :authenticate_user!

	def index
		@trip = Trip.new
	end

	def new
		@trip = Trip.new
	end

	def create
		safe_trip = params.require(:trip).permit(:city_id)
		@trip = current_user.trips.new safe_trip
		@trip.city_id = params[:trip][:city_id]
		@trip.save
		redirect_to @trip
	end

	def show
		@trip = Trip.find(params[:id])
		@trip_id = params[:id]
		@user = current_user
		@attractions = Attraction.where(trip_id: @trip_id)
		@comments = Comment.where(trip_id: @trip_id)
	end

	def usertrips
		@trips = current_user.trips.all
		@user = current_user
	end

	def alltrips
		puts params
		@city_selection = params[:city]
		@city = City.where(name: params[:city])
		@user = current_user
		@trips = Trip.where(city_id: @city)
	end

	def destroy
	    @trip = Trip.find(params[:id])
	    @trip.destroy
	    redirect_to root_path
  	end 

end
