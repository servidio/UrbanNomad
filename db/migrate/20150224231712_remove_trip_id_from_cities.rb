class RemoveTripIdFromCities < ActiveRecord::Migration
  def change
  	remove_column :cities, :trip_id 
  end
end
