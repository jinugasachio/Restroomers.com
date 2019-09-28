class RemoveUrlFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :url, :string
  end
end
