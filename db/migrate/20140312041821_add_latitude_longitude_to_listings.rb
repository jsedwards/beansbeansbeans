class AddLatitudeLongitudeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latitude, :decimal, precision: 9, scale: 6
    add_column :listings, :longitude, :decimal, precision: 9, scale: 6
  end
end
