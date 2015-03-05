class AddImageToCities < ActiveRecord::Migration
  def change
    add_column :cities, :Image, :string
  end
end
