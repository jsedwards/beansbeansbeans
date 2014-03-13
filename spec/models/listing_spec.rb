require "spec_helper"

describe Listing do 
  describe "close" do 
    it "can determine how close" do 
      near_listing = Listing.create!(name: "Close", latitude: 39.000010, longitude: -122.000000)
      far_listing = Listing.create!(name: "Far", latitude: 40.000000, longitude: -123.000000)
      close_listing = Listing.close_to(39.000000, -122.000000)
      expect(close_listing.first).to eq(near_listing)
      expect(close_listing.size).to eq(1)
    end
  end
end