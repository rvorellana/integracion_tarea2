class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :etrack
      t.string :name
      t.integer :duration
      t.float :times_played
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
