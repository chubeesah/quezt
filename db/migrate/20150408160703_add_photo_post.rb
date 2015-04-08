class AddPhotoPost < ActiveRecord::Migration
  def change
    add_column :polls, :photo_post, :string
  end
end
