class AddPointsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :points, :integer
  end
end
