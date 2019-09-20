class AddNullConstraint0fNameToShops < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shops, :name, false
  end
end
