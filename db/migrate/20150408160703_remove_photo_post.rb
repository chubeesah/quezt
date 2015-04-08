class RemovePhotoPost < ActiveRecord::Migration
  def change
    remove_column :polls, :photo_post
    add_column :polls, :photo_post, :string
  end
end
