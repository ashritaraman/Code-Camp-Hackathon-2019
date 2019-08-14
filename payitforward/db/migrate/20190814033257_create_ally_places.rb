class CreateAllyPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :ally_places do |t|
      t.references :place, foreign_key: true
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :donation
      t.string :description

      t.timestamps
    end
  end
end
