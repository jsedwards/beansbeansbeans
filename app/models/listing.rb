class Listing < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
  where(%{
    ST_DWithin(
      ST_GeographyFromText(
        'SRID=4326;POINT(' || listings.longitude || ' ' || listings.latitude || ')'
      ),
      ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
      %d
    )
  } % [longitude, latitude, distance_in_meters])
  }

  def self.coords
    coords = []
    Listing.all.each do |listing|
      coords << {lat: listing.latitude.to_f, lng: listing.longitude.to_f, name: listing.name, id: listing.id }
    end
    coords
  end
end