class AddPointIndexToListings < ActiveRecord::Migration
  def up
    execute %{
      create index index_on_listings_location ON listings using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || listings.longitude || ' ' || listings.latitude || ')'
        )
      )
    }
  end
    def down
    execute %{drop index index_on_listings_location}
  end
end
