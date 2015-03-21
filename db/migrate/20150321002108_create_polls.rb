class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :user_id
      t.string :question
      t.integer :vote_1
      t.integer :vote_2
      t.integer :vote_3
      t.integer :vote_4
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
