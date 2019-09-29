class ChangeColumsToDetail < ActiveRecord::Migration[5.2]
  def change
    change_column :details, :open, :string
    change_column :details, :close, :string
  end
end
