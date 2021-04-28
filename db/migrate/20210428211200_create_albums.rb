class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :ealbum
      t.references :artist, foreign_key: true
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
