class AddBudgetDinnerToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :budget_dinner, :string
  end
end
