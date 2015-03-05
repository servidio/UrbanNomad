class AddInfoToCities < ActiveRecord::Migration
  def change
    add_column :cities, :Info, :text
  end
end
