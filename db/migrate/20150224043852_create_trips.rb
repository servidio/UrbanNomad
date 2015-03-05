class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :city
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :trips, :users
  end
end
