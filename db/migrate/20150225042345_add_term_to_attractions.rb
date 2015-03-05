class AddTermToAttractions < ActiveRecord::Migration
  def change
  	add_column :attractions, :terms, :string
  end
end
