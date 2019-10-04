class AddNullConstraintOfAddressToShops < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shops, :address, false
  end
end
