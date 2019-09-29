class AddColumsToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :membership, :integer
    add_column :facilities, :rate_plan, :string
  end
end
