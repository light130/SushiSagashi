class AddNullConstraintOfLatitudeToShops < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shops, :latitude, false
  end
end
