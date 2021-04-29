class AddArtistToTrack < ActiveRecord::Migration[5.2]
  def change
    add_reference :tracks, :artist, foreign_key: true
  end
end
