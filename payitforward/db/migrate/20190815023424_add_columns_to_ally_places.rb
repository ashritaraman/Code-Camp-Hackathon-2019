class AddColumnsToAllyPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :ally_place, :hours_of_operation, :string
    add_column :ally_place, :category, :string
  end
end
