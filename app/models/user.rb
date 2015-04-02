class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                                          :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :polls

  attr_accessor :content_type, :original_filename, :image_data
  before_save :decode_base64_image

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def as_json(opts={})
    super(only: [:bar_name, :email, :authentication_token])
  end

  private
    
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
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
