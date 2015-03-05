class RemoveTermFromAttractions < ActiveRecord::Migration
  def change
  	remove_column :attractions, :term
  end
end
