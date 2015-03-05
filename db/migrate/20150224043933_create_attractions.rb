class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.references :trip, index: true

      t.timestamps null: false
    end
    add_foreign_key :attractions, :trips
  end
end
