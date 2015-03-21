class AddAnswersToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :answer_1, :string
    add_column :polls, :answer_2, :string
    add_column :polls, :answer_3, :string
    add_column :polls, :answer_4, :string
  end
end
