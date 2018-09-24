class AddGeolocalisationToCrash < ActiveRecord::Migration[5.2]
  def change
    add_column :crashes, :localisation, :string
    add_column :crashes, :latitude, :float
    add_column :crashes, :longitude, :float
  end
end
