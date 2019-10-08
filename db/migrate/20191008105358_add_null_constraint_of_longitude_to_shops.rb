class AddNullConstraintOfLongitudeToShops < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shops, :longitude, false
  end
end
