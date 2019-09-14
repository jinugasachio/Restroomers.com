class ChangeColumnOfPowderRooms < ActiveRecord::Migration[5.2]
  def change
    change_column :powder_rooms, :lat, :double
    change_column :powder_rooms, :lng, :double
  end
end
