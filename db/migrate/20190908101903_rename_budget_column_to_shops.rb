class RenameBudgetColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :budget, :budget_lunch
  end
end
