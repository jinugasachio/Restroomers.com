class ChangeColumnInFacilities < ActiveRecord::Migration[5.2]
  def change
    change_column :facilities, :membership, :string
  end
end
