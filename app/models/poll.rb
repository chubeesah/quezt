class Poll < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo_post, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  before_save :decode_base64_image

  def vote_for_1(poll)  
    vote1 = poll.vote_1.to_i
    if self.answer_1 
      vote1 += 1
    end
    poll.update(vote_1: vote1)
  end

  def vote_for_2(poll)
    vote2 = poll.vote_2.to_i
    if self.answer_2
      vote2 += 1
    end
    poll.update(vote_2: vote2)
  end

  def vote_for_3(poll)
    vote3 = poll.vote_3.to_i
    if self.answer_3
      vote3 += 1
    end
    poll.update(vote_3: vote3)
  end 

  def vote_for_4(poll)
    vote4 = poll.vote_4.to_i
    if self.answer_4
      vote4 += 1
    end
    poll.update(vote_4: vote4)
  end 

  protected
    def decode_base64_image
      if image_data && content_type && original_filename
        decoded_data = Base64.decode64(image_data)
 
        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
 
        data.content_type = content_type
        data.original_filename = File.basename(original_filename)
 
        self.image = data
      end
    end
end
end
