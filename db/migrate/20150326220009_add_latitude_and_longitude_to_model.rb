class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :polls, :latitude, :float
    add_column :polls, :longitude, :float
  end
end
