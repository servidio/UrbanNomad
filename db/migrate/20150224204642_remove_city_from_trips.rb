class RemoveCityFromTrips < ActiveRecord::Migration
  def change
  	remove_column :trips, :city
  end
end
