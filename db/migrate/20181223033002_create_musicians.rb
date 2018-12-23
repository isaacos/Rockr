class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :instrument
      t.string :description
      t.integer :time_for_music

      t.timestamps
    end
  end
end
