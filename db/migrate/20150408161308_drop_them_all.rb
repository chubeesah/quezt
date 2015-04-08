class DropThemAll < ActiveRecord::Migration
  def change
    remove_column :polls, :photo_post_file_name
    remove_column :polls, :photo_post_content_type
    remove_column :polls, :photo_post_file_size
    remove_column :polls, :photo_post_updated_at
  end
end
