class AddPhotoPostToPolls < ActiveRecord::Migration
  def self.up
    add_attachment :polls, :photo_post
  end

  def self.down
    remove_attachment :polls, :photo_post
  end
end
