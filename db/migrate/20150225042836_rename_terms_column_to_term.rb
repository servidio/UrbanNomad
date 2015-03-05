class RenameTermsColumnToTerm < ActiveRecord::Migration
  def change
  	rename_column :attractions, :terms, :term
  end
end
