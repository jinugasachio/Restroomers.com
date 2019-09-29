class AddUrlsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :urls, :json
  end
end
