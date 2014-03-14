class AddAddressToListings < ActiveRecord::Migration
  def change
    add_column :listings, :street_address, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :zipcode, :string
  end
end
