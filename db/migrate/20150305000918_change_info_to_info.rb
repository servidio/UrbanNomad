class ChangeInfoToInfo < ActiveRecord::Migration
  def change
  	rename_column :cities, :Info, :info
  end
end
