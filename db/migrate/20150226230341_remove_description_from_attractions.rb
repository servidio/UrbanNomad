class RemoveDescriptionFromAttractions < ActiveRecord::Migration
  def change
  	remove_column :attractions, :description
  end
end
