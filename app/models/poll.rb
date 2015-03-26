class Poll < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo_post, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
