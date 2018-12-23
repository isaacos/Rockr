class CreateMusicianBands < ActiveRecord::Migration[5.2]
  def change
    create_table :musician_bands do |t|
      t.integer :musician_id
      t.integer :band_id

      t.timestamps
    end
  end
end
