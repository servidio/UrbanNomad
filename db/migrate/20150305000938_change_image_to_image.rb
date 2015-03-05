class ChangeImageToImage < ActiveRecord::Migration
  def change
  	rename_column :cities, :Image, :image
  end
end
