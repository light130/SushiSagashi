class ChangeDatatypeBudgetDinnerofShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :budget_dinner, 'integer USING CAST(budget_dinner AS integer)'
  end
end
