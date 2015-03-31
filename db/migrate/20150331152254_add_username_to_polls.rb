class AddUsernameToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :username, :string
  end
end
