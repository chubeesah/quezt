class Poll < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo_post, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def vote_for(poll)  
    vote1 = poll.vote_1.to_i
    vote2 = poll.vote_2.to_i
    vote3 = poll.vote_3.to_i
    vote4 = poll.vote_4.to_i
    if self.answer_1 
      vote1 += 1
    elsif self.answer_2
      vote2 += 1
    elsif self.answer_3
      vote3 += 1
    elsif self.answer_4
      vote4 += 1
    end
    poll.update(vote_1: vote1, vote_2: vote2,
                vote_3: vote3, vote_4: vote4)
  end
end
