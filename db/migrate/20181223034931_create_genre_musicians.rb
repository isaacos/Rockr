class CreateGenreMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_musicians do |t|
      t.integer :musician_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
