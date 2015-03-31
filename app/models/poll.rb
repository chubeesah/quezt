class Poll < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo_post, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def vote_for(poll)  
    vote1 = poll.vote_1
    vote2 = poll.vote_2
    vote3 = poll.vote_3
    vote4 = poll.vote_4
    if poll.answer_1
      vote1 += 1
    elsif poll.answer_2
      vote2 += 1
    elsif poll.answer_3
      vote3 += 1
    elsif poll.answer_4
      vote4 += 1
    end
    poll.update(vote_1: vote1, vote_2: vote2,
                vote_3: vote3, vote_4: vote4)
  end
end
