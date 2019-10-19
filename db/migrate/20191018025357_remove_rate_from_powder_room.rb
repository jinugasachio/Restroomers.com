class RemoveRateFromPowderRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :powder_rooms, :rate, :integer
  end
end
