class RemoveRentalFromFacilities < ActiveRecord::Migration[5.2]
  def change
    remove_column :facilities, :rental, :string
  end
end
