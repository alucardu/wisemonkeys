class AddImageCacheToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :image_cache, :string
  end
end
