class AddBasicInfoToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :day_off, :string
    add_column :shops, :phone_number, :string
  end
end
