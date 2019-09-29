class RenameWaitingSofaToFacilities < ActiveRecord::Migration[5.2]
  def change
    rename_column :facilities, :waiting_sofa, :waiting_space
  end
end
