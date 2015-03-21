class Poll < ActiveRecord::Base
  require 'paperclip'
  belongs_to :user
end
