class AddDescriptionToAttractions < ActiveRecord::Migration
  def change
  	add_column :attractions, :description, :string
  end
end
