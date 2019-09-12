class ChangeDatatypeBudgetLunchofShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :budget_lunch, 'integer USING CAST(budget_lunch AS integer)'
  end
end
