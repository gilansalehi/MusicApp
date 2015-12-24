class CreateTrack < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false

      t.timestamps
    end
  end
end
