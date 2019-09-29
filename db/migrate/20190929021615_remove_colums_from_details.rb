class RemoveColumsFromDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :details, :membership, :integer
    remove_column :details, :rate_plan, :string
  end
end
